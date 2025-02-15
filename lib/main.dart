import 'package:flutter/material.dart';
import 'package:gym_app/LoginScreens/3.0_Log_In/Login_3_A.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login_3_A(),
    );
  }
}
