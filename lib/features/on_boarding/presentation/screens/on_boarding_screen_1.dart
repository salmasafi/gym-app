import 'package:flutter/material.dart';
import 'package:gym_app/features/on_boarding/presentation/screens/screen_boarding_1.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/on_boarding_background_1.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/Rectangle.png',
                fit: BoxFit.cover,
                width: screenWidth,
                height: screenHeight,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 326,
                    left: 100,
                  ),
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                      color: Color(0xFFE2F163),
                      fontFamily: "LeagueSpartan-Extrabold",
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 90),
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 75),
                  child: Text(
                    "Gym App",
                    style: TextStyle(
                      color: Color(0xFFE2F163),
                      fontFamily: "Poppins",
                      fontSize: 54.04,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
