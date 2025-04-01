import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/StateManagement/cubit_startbutton/startbutton_cubit.dart';
import 'package:gym_app/StateManagement/cubit_BMI/bmi_info_request_cubit.dart';
import 'package:gym_app/Screens/on_boarding/presentation/screens/on_boarding_screen_1.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartbuttonCubit(),
        ),
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
    );
  }
}
