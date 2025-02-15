import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/features/profile/presentation/widgets/profilebody.dart';
//import 'package:gym_app/profile/presentation/widgets/profilebody.dart';

class SixdotOneProfileScreen extends StatelessWidget {
  const SixdotOneProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("My Profile"),
      ),*/
      body:Body(),
    );
    /*return const ScreenUtilInit(
      designSize: const Size(393,852),
      minTextAdapt: true,
      splitScreenMode: true,
    );*/
  }
}
