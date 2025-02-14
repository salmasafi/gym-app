import 'package:flutter/material.dart';
import 'package:gym_app/setup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
////////////////////////////////////////////////////
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
    );
    }

    );
  }
}
