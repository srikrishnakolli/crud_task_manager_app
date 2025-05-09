// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBmV-Paf4rc7Xu-gKO8W25ROXeB3UQxTfk',
    appId: '1:404241891016:web:4d689a95ca15772f36effd',
    messagingSenderId: '404241891016',
    projectId: 'taskmanagerapp-93e6c',
    authDomain: 'taskmanagerapp-93e6c.firebaseapp.com',
    storageBucket: 'taskmanagerapp-93e6c.firebasestorage.app',
    measurementId: 'G-WJ7S7N1XJ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhG2wM30Qcys21-SIMDgvpoDR07ieTEQE',
    appId: '1:404241891016:android:5cf44195a3e7a11736effd',
    messagingSenderId: '404241891016',
    projectId: 'taskmanagerapp-93e6c',
    storageBucket: 'taskmanagerapp-93e6c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCA-tgpN0P43hOMhZLoCHZY-Zyc6ctheB8',
    appId: '1:404241891016:ios:cb733ed0b94e25a936effd',
    messagingSenderId: '404241891016',
    projectId: 'taskmanagerapp-93e6c',
    storageBucket: 'taskmanagerapp-93e6c.firebasestorage.app',
    iosBundleId: 'com.example.taskManagerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCA-tgpN0P43hOMhZLoCHZY-Zyc6ctheB8',
    appId: '1:404241891016:ios:cb733ed0b94e25a936effd',
    messagingSenderId: '404241891016',
    projectId: 'taskmanagerapp-93e6c',
    storageBucket: 'taskmanagerapp-93e6c.firebasestorage.app',
    iosBundleId: 'com.example.taskManagerApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBmV-Paf4rc7Xu-gKO8W25ROXeB3UQxTfk',
    appId: '1:404241891016:web:b2c5140046cbbbfb36effd',
    messagingSenderId: '404241891016',
    projectId: 'taskmanagerapp-93e6c',
    authDomain: 'taskmanagerapp-93e6c.firebaseapp.com',
    storageBucket: 'taskmanagerapp-93e6c.firebasestorage.app',
    measurementId: 'G-YTZSEP03KS',
  );
}
