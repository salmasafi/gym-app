import 'dart:ui';
import 'package:flutter/material.dart';
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    Positioned.fill(
                      child: Image.asset(
                        _onboardingData[index]["image"]!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/Rectangle_1.png',
                        fit: BoxFit.cover,
                        width: screenWidth,
                        height: screenHeight,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 65, left: 315),
                              child: GestureDetector(
                                onTap: () {
                                  _controller
                                      .jumpToPage(_onboardingData.length - 1);
                                },
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Color(0xFFE2F163),
                                    fontSize: 18,
                                    fontFamily: "LeagueSpartan",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 65),
                              child: Icon(
                                Icons.arrow_right_sharp,
                                size: 30,
                                color: Color(0xFFE2F163),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 272),
                          child: Container(
                            color: Color(0xFFB3A0FF),
                            width: screenWidth,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Image.asset(
                                    _onboardingData[index]["logo"]!,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 8),
                                  child: Text(
                                    _onboardingData[index]["title"]!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: _onboardingData.length,
                          effect: WormEffect(
                            activeDotColor: Color(0xFFE2F163),
                            dotColor: Colors.white,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            if (_currentIndex == _onboardingData.length - 1) {
                              // Navigate to home screen
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
                                    height: screenHeight * 0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white, width: 0.3),
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.09),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Center(
                                    child: Text(
                                      _currentIndex ==
                                              _onboardingData.length - 1
                                          ? "Get Started"
                                          : "Next",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
