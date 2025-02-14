import 'package:flutter/material.dart';
import 'package:gym_app/core/custom_button.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/onboarding/weight_screen.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AgeSelectionScreenState createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int _currentAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerRight,
          icon: Image.asset('assets/icons/Arrow.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          child: Text(
            "Back",
            style: TextStyle(color: AppColors.secondaryColor, fontSize: 16 , fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How Old Are You?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            decoration: BoxDecoration(color: AppColors.blackColor),
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 40),
          Text(
            "$_currentAge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Icon(Icons.arrow_drop_up, color: Colors.yellow, size: 40),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            color: AppColors.primaryColor,
            child: NumberPicker(
              itemHeight: 100,
              itemCount: 6,
              value: _currentAge,
              minValue: 15,
              maxValue: 99,
              axis: Axis.horizontal,
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              onChanged: (value) {
                setState(() {
                  _currentAge = value;
                });
              },
            ),
          ),
          Spacer(),
          CustomButton(
            buttonText: "Next",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WeightSelectionScreen()));
            },
            width: 178,
            height: 44,
            buttonColor: Color(0xff373737),
            borderRadius: 30,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
