import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD:lib/Presentation/LoginScreens/3.0_Log_In/Login_3_B.dart
import 'package:gym_app/Presentation/LoginScreens/3.0_Log_In/Login_3_A.dart';
import 'package:gym_app/core/Widgets_Login/button.dart';
import 'package:gym_app/core/Widgets_Login/name__for__text_field.dart';
import 'package:gym_app/core/Widgets_Login/sign_up__icons.dart';
import 'package:gym_app/core/Widgets_Login/text_fields.dart';
import 'package:gym_app/core/Widgets_Login/text_fields__passwords.dart';
import 'package:gym_app/core/utils/colors.dart';
=======
import 'package:gym_app/LoginScreens/3.0_Log_In/Login_3_A.dart';
import 'package:gym_app/LoginScreens/Forgot_and_Reset_Password/B_3.1_Set_Password.dart';
import 'package:gym_app/Widgets/Widgets.dart';
>>>>>>> e5fa348127a5a97fff24bf7a33f4446de2abf399:lib/LoginScreens/3.0_Log_In/Login_3_B.dart

import '../Forgot_and_Reset_Password/C_3.1_Set_Your_Fingerprint.dart';

// This is the Sign Up Screen
class Login_3_B extends StatelessWidget {
  const Login_3_B({super.key});

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
          "Create Account",
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
            SizedBox(height: Screenheight * 0.05),
            Text("Let's start!",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: Screenheight * 0.03,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: Screenheight * 0.05),
            Container(
              padding: EdgeInsets.symmetric(vertical: Screenheight * 0.02),
              //height: Screenheight * 0.37,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.pinkcontainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Name_For_TextField(
                      Name: "Fullname", ScreenWidth: ScreenWidth),
                  TextFields(
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                  Name_For_TextField(
                      Name: "Email or Mobile Number", ScreenWidth: ScreenWidth),
                  TextFields(
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                  Name_For_TextField(
                      Name: "Password", ScreenWidth: ScreenWidth),
                  TextFields_Passwords(
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                  Name_For_TextField(
                      Name: "Confirm Password", ScreenWidth: ScreenWidth),
                  TextFields_Passwords(
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                ],
              ),
            ),
            SizedBox(height: Screenheight * 0.02),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continuing, you agree to',
                    style: TextStyle(
                      fontFamily: "League Spartan",
                      color: AppColors.TextColor,
                      fontSize: Screenheight * 0.014,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms of Use',
                        style: TextStyle(
                          fontFamily: "League Spartan",
                          color: AppColors.buttonandIConColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(
                          fontFamily: "League Spartan",
                          color: Colors.white,
                          fontSize: Screenheight * 0.014,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          fontFamily: "League Spartan",
                          color: AppColors.buttonandIConColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: Screenheight * 0.02),
            Button(
              Screenheight: Screenheight,
              NameButton: "Sign Up",
              Location: setPassword(),
            ),
            SizedBox(height: Screenheight * 0.02),
            Text(
              "or sign up with",
              style: TextStyle(
                  color: AppColors.TextColor, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: Screenheight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignUp_Icons(
                  Screenheight: Screenheight,
                  ScreenWidth: ScreenWidth,
                  Images: "Google Icon.png",
                ),
                SizedBox(width: ScreenWidth * 0.04),
                SignUp_Icons(
                  Screenheight: Screenheight,
                  ScreenWidth: ScreenWidth,
                  Images: "Facebook Icon.png",
                ),
                SizedBox(width: ScreenWidth * 0.04),
                SignUp_Icons(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => fingerPrint(),
                      ),
                    );
                  },
                  Screenheight: Screenheight,
                  ScreenWidth: ScreenWidth,
                  Images: "Fingerprint Icon.png",
                ),
              ],
            ),
            SizedBox(height: Screenheight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: AppColors.TextColor, fontWeight: FontWeight.w300),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: AppColors.buttonandIConColor,
                          fontWeight: FontWeight.w300),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
