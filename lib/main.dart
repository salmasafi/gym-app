import 'package:flutter/material.dart';
//import 'package:gym_app/features/GymCoachCatogery/presentation/gymcoachcategory.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
import 'package:gym_app/features/Search/presentation/search.dart';
//import 'package:gym_app/features/favourties/presentation/favourites.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //OnBoardingScreen1()
      home: SearchScreen(),
    );
  }
}
