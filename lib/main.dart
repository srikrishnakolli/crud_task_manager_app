import 'package:flutter/material.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class Task {
  String name;
  bool isCompleted;
  String priority;

  Task({required this.name, this.isCompleted = false, required this.priority});
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();
  String _selectedPriority = 'Medium';

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(name: _taskController.text, priority: _selectedPriority));
        _taskController.clear();
      });
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.blue[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'Enter task name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedPriority,
                    dropdownColor: Colors.white,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPriority = newValue!;
                      });
                    },
                    items: ['Low', 'Medium', 'High']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addTask,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    ),
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Checkbox(
                          value: _tasks[index].isCompleted,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            _toggleTaskCompletion(index);
                          },
                        ),
                        title: Text(
                          _tasks[index].name,
                          style: TextStyle(
                            decoration: _tasks[index].isCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text('Priority: ${_tasks[index].priority}',
                            style: TextStyle(color: Colors.redAccent)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteTask(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
