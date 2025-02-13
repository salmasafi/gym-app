import 'package:flutter/material.dart';
import 'package:gym_app/age_selection_screen.dart';
import 'package:gym_app/setup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MotivationScreen(),
    );
  }
}
