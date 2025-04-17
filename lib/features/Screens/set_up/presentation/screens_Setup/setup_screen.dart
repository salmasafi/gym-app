import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/Widgets/widgets/custom_button.dart';
import 'package:gym_app/features/Screens/set_up/presentation/screens_Setup/gender_screen.dart';

class MotivationScreen extends StatelessWidget {
  const MotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/setup.png'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Consistency Is\nThe Key To Progress.\nDon't Give Up!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Paragraph
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Custom Button
                CustomButton(
                  buttonText: "Next",
                  onPress: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GenderSelectionScreen()));
                  },
                  width: 178,
                  height: 44,
                 buttonColor: Color(0xff373737),
                  borderRadius: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
