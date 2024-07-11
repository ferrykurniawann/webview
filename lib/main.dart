import 'package:flutter/material.dart';
import 'homePage.dart';
import 'loginPage.dart';
// import 'package:myapp/registrationPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(), // Use the correct class name HomePage
    );
  }
}
