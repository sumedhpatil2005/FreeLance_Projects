import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shivaydairy/app_theme.dart';
import 'package:shivaydairy/cartpage.dart';
import 'package:shivaydairy/cartprovider.dart';
import 'package:shivaydairy/details.dart';
import 'package:shivaydairy/home.dart';
import 'package:shivaydairy/login.dart';
import 'package:shivaydairy/otppage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartProvider(), child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Login(),
    );
  }
}
