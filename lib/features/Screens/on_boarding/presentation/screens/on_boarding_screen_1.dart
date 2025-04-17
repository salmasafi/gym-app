import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/Screens/on_boarding/presentation/screens/screen_boarding_1.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/on_boarding_background_1.png',
              fit: BoxFit.cover,
            ),
          ),
          // Transparent Background Overlay
          Positioned.fill(
            child: Image.asset(
              'assets/images/Rectangle.png',
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
          ),
          // Centered Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // "Welcome to" Text
                Text(
                  "Welcome to",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontFamily: "LeagueSpartan-Extrabold",
                    fontWeight: FontWeight.w900,
                    fontSize: screenWidth * 0.08, // Responsive font size
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.02), // Adjust spacing
                // Logo Image
                Image.asset(
                  "assets/images/logo.png",
                  width: screenWidth * 0.4, // Responsive logo size
                ),
                SizedBox(height: screenHeight * 0.02),
                // "Gym App" Text
                Text(
                  "Gym App",
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.12,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
