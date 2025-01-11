import 'package:flutter/material.dart';
import 'package:shivaydairy/details.dart';
import 'package:shivaydairy/home.dart';
import 'package:shivaydairy/otppage.dart';
import 'login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: details(),
    );
  }
}
