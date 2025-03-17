import 'package:flutter/material.dart';
class WeeklyChallengeCard extends StatelessWidget {
  const WeeklyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      height: 125,
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /// Text Section
          Expanded(
            child: Stack(
              children: [
                /// Main Title & Subtitle
                Positioned(
                  top:40,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Weekly',
                        style: TextStyle(
                          color: Color(0xffE2F163),
                          fontFamily:"Poppins" ,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      Text(
                        'Challenge',
                        style: TextStyle(
                          color: Color(0xffE2F163),
                          fontFamily:"Poppins" ,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Plank with a Twist',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),

                /// Blue Label

              ],
            ),
          ),

          /// Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/images/weeklychalleng.jpg",
              height: double.infinity,
              width: 175,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}