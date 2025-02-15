import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gym_app/LoginScreens/3.0_Log_In/Login_3_A.dart';
=======
import 'package:gym_app/features/set_up/presentation/screens/setup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> a208192849b6ecc659e0f0a899ff32ba36738c19

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const MaterialApp(
      home: Login_3_A(),
      // body: Center(
      //   child: Login_3_1(),
      //   // child: Text('Hello World!'),
      // ),
=======
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
       builder: (_, child){
        return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MotivationScreen(),
    );
    }

>>>>>>> a208192849b6ecc659e0f0a899ff32ba36738c19
    );
    // );
  }
}
