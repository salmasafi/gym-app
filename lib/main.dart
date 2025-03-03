import 'package:flutter/material.dart';
import 'package:gym_app/features/homescreen/presentation/screens/home_screen.dart';
import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
import 'package:gym_app/features/profil/presentation/screens/edit_profile.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
//import 'package:gym_app/features/profile/presentation/screens/6.1.1profile_edit.dart';

//import 'package:gym_app/features/set_up/presentation/screens/setup_screen.dart';
//import 'package:gym_app/setup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
      //home: OnBoardingScreen1(),
      // home: SixdotOneProfileScreen(),
      //home: ProfileEdit(),
      //home: NotificationScreenWorkout(),
    );
  }
}
