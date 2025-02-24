import 'package:flutter/material.dart';

import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/features/set_up/presentation/screens/age_screen.dart';


class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

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
            style: TextStyle(color:AppColors.secondaryColor, fontSize: 16 , fontWeight: FontWeight.bold),
          ),
        ),
  ),
  
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What's Your Gender",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'Male';
                });
              },
              child: GenderOption(
                icon: Icons.male,
                label: 'Male',
                isSelected: selectedGender == 'Male',
                iconColor:
                    selectedGender == 'Male' ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedGender = 'Female';
                });
              },
              child: GenderOption(
                icon: Icons.female,
                label: 'Female',
                isSelected: selectedGender == 'Female',
                iconColor:
                    selectedGender == 'Female' ? Colors.black : Colors.white,
              ),
            ),
            Spacer(),
            CustomButton(
              buttonText: "Next",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AgeSelectionScreen(),
                  ),
                );
              },
              width: 178,
              height: 44,
              buttonColor: Color(0xff373737),
              borderRadius: 30,
             
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class GenderOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Color iconColor;

  const GenderOption({super.key, 
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondaryColor : Color(0xff363636),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Icon(icon, size: 100, color: iconColor),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ],
    );
  }
}
