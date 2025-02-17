import 'package:flutter/material.dart';
import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';

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
      home: OnBoardingScreen1(),
      // home: SixdotOneProfileScreen(),
      //home: ProfileEdit(),
      //home: NotificationScreenWorkout(),
    );
  }
}
