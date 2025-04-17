import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/features/Screens/LoginScreens/Forgot_and_Reset_Password/B_3.1_Set_Password.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/button.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/name__for__text_field.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/text_fields.dart';
import 'package:gym_app/core/utils/colors.dart';

class ForgotenPassword extends StatelessWidget {
  const ForgotenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double Screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColors,
        foregroundColor: AppColors.buttonandIConColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_left_outlined,
            size: Screenheight * 0.04,
          ),
          color: AppColors.buttonandIConColor,
        ),
        centerTitle: true,
        title: Text(
          "Forgotten Password",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: ScreenWidth * 0.06,
              fontWeight: FontWeight.bold,
              fontVariations: [
                FontVariation('ital', 0),
                FontVariation('wght', 700),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Screenheight * 0.1),
            Text("Forgot Password?",
                style: GoogleFonts.poppins(
                    color: AppColors.TextColor,
                    fontSize: Screenheight * 0.03,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: Screenheight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenWidth * 0.1),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: GoogleFonts.leagueSpartan(
                    color: AppColors.TextColor,
                    fontSize: Screenheight * 0.015,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Screenheight * 0.05),
            Container(
              padding: EdgeInsets.symmetric(vertical: Screenheight * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.pinkcontainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Name_For_TextField(
                      Name: "Enter your email address",
                      ScreenWidth: ScreenWidth),
                  TextFields(
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                ],
              ),
            ),
            SizedBox(height: Screenheight * 0.05),
            Button(
              Screenheight: Screenheight,
              NameButton: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => setPassword(),
                  ),
                );
              },
            ),
            SizedBox(height: Screenheight * 0.04),
          ],
        ),
      ),
    );
  }
}
