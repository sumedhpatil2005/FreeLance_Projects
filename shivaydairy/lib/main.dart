import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shivaydairy/core/theme/app_theme.dart';
import 'package:shivaydairy/presentations/screens/cart/cartprovider.dart';
import 'package:shivaydairy/presentations/screens/login/login.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CartProvider(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Login(),
    );
  }
}
