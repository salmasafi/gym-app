import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/core/Logic/cubit_BMI/bmi_info_request_cubit.dart';
import 'package:gym_app/features/Screens/on_boarding/presentation/screens/screen_boarding_1.dart';
//import 'package:gym_app/features/GymCoachCatogery/presentation/gymcoachcategory.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
//import 'package:gym_app/features/favourties/presentation/favourites.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BmiInfoRequestCubit()),
        BlocProvider(create: (_) => StartbuttonCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnboardingScreen(),
        ),
      ),);
  }
}
