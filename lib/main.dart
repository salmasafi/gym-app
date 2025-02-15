import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gym_app/profile/presentation/screens/6.1profile.dart';
import 'package:gym_app/setup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
import 'package:gym_app/LoginScreens/3.0_Log_In/Login_3_A.dart';
>>>>>>> 4f0cff0aeca3d2901ee832f6b4f64688b6d2eb9e

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
       builder: (_, child){
        return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MotivationScreen(),
          //home: SixdotOneProfileScreen(),
    );
    }

=======
    return const MaterialApp(
      home: Login_3_A(),
>>>>>>> 4f0cff0aeca3d2901ee832f6b4f64688b6d2eb9e
    );
  }
}
