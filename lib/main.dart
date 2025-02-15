import 'package:flutter/material.dart';
import 'package:gym_app/features/profile/presentation/screens/6.1profile.dart';
//import 'package:gym_app/features/set_up/presentation/screens/setup_screen.dart';

//import 'package:gym_app/setup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/setup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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

    );
  }
}
