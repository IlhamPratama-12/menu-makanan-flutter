import 'package:flutter/material.dart';
import 'package:p_satu/auth/login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prak 2 Vava',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
