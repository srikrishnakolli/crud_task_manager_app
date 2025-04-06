import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final taskCtrl = TextEditingController();
  String priority = "Medium";

  Future<void> _submitTask() async {
  if (!_formKey.currentState!.validate()) return;

  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("User not logged in");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("User not logged in")),
    );
    return;
  }

  print("Saving task for user: ${user.uid}");

  try {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .add({
      'title': taskCtrl.text.trim(),
      'completed': false,
      'priority': priority,
      'timestamp': FieldValue.serverTimestamp(),
    });
    print("✅ Task saved successfully");
    Navigator.pop(context);
  } catch (e) {
    print("❌ Error saving task: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error saving task: $e")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: taskCtrl,
                decoration: const InputDecoration(labelText: "Task Title"),
                validator: (val) => val!.isEmpty ? "Enter task title" : null,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: priority,
                decoration: const InputDecoration(labelText: "Priority"),
                items: ["High", "Medium", "Low"]
                    .map((level) => DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => priority = value!),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitTask,
                child: const Text("Save Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
