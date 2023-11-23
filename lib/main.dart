import 'package:flutter/material.dart';
import 'package:login_test_project/login_screen.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test Login ApI',
      //home: LoginScreen(),
      home: HomeScreen(),

    );
  }
}







