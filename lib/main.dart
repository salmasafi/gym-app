import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/features/Logic/Cubit/cubit/bmi_info_request_cubit.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';
//import 'package:gym_app/features/Search/presentation/search.dart';
//import 'package:gym_app/features/favourties/presentation/favourites.dart';
//import 'package:gym_app/features/on_boarding/presentation/screens/on_boarding_screen_1.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
        );
        return child!;
      },
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BmiInfoRequestCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen1(),
        // home: SixdotOneProfileScreen(),
        //home: ProfileEdit(),
        //home: NotificationScreenWorkout(),
      ),
=======
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //OnBoardingScreen1()
      home: OnBoardingScreen1(),
>>>>>>> saif
    );
=======
    return BlocProvider(
      create: (context) => StartbuttonCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: OnBoardingScreen1(),
        ),
      ),
      );
>>>>>>> e5fa348127a5a97fff24bf7a33f4446de2abf399
  }
}
