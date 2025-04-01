import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gym_app/Screens/LoginScreens/3.0_Log_In/Login_3_A.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/boarding_1.png",
      "title": "Start Your Journey Towards A More Active Lifestyle",
      "logo": "assets/images/work_out_logo.png",
    },
    {
      "image": "assets/images/boarding_2.png",
      "title": "Find Nutrition Tips That Fit Your Lifestyle",
      "logo": "assets/images/Nutrition.png",
    },
    {
      "image": "assets/images/boarding_3.png",
      "title": "A Community For You, Challenge Yourself",
      "logo": "assets/images/Community.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      _onboardingData[index]["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Transparent Overlay
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/Rectangle_1.png',
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenHeight,
                    ),
                  ),
                  // Skip Button
                  Positioned(
                    top: screenHeight * 0.08,
                    right: screenWidth * 0.05,
                    child: GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(_onboardingData.length - 1);
                      },
                      child: Row(
                        children: [
                          Text(
                            "Skip",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontSize: screenWidth * 0.045,
                              fontFamily: "LeagueSpartan",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right_sharp,
                            size: screenWidth * 0.07,
                            color: AppColors.secondaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Content Container
                  Positioned(
                    top: screenHeight * 0.38,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: AppColors.primaryColor,
                      width: screenWidth,
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            _onboardingData[index]["logo"]!,
                            width: screenWidth * 0.2,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.05),
                            child: Text(
                              _onboardingData[index]["title"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: screenWidth * 0.05,
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Page Indicator
                  Positioned(
                    top: screenHeight * 0.65,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: _onboardingData.length,
                        effect: WormEffect(
                          activeDotColor: AppColors.secondaryColor,
                          dotColor: AppColors.whiteColor,
                          dotHeight: screenWidth * 0.02,
                          dotWidth: screenWidth * 0.02,
                        ),
                      ),
                    ),
                  ),
                  // Next / Get Started Button
                  Positioned(
                    top: screenHeight * 0.75,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if (_currentIndex == _onboardingData.length - 1) {
                            // Navigate to home screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_3_A()),
                            );
                          } else {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                child: Container(
                                  width: screenWidth * 0.53,
                                  height: screenHeight * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AppColors.whiteColor,
                                        width: 0.3),
                                    color: Color.fromRGBO(255, 255, 255, 0.09),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    _currentIndex == _onboardingData.length - 1
                                        ? "Get Started"
                                        : "Next",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w700,
                                      fontSize: screenWidth * 0.045,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
