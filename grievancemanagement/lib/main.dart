import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grievancemanagement/presentations/views/login_screen.dart';
import 'package:grievancemanagement/presentations/views/moderator/moderator_dashboard.dart';
import 'package:grievancemanagement/presentations/views/signup_screen.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAaHnxnOLhPpDwf7P8iyfnzUthA9tOfUKk",
      appId: "1:184633312583:android:8306b4c86a9367e9ed7862",
      messagingSenderId: "184633312583",
      projectId: "grievancemanagement-85970",
    ),
  );

  // Run the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grievance Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(), // Set the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}
