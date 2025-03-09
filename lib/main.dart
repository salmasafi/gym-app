import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/features/set_up/presentation/screens/sc_405.dart';
import 'package:gym_app/features/set_up/presentation/screens/sc_406.dart';
import 'package:gym_app/features/set_up/presentation/screens/sc_408.dart';
=======
import 'package:gym_app/features/homescreen/presentation/screens/home_screen.dart';
import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
import 'package:gym_app/features/profil/presentation/screens/edit_profile.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
//import 'package:gym_app/features/profile/presentation/screens/6.1.1profile_edit.dart';
>>>>>>> 2199e6c14a5c7e44f255798e373712280c48e7a5

//import 'package:gym_app/features/set_up/presentation/screens/setup_screen.dart';
//import 'package:gym_app/setup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => StartbuttonCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Sc405(),
          // home: SixdotOneProfileScreen(),
          //home: ProfileEdit(),
          //home: NotificationScreenWorkout(),
        ),
      ),
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
      //home: OnBoardingScreen1(),
      // home: SixdotOneProfileScreen(),
      //home: ProfileEdit(),
      //home: NotificationScreenWorkout(),
>>>>>>> 2199e6c14a5c7e44f255798e373712280c48e7a5
    );
  }
}
