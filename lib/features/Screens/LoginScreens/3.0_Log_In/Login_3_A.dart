// this is the log in screen
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/features/Screens/LoginScreens/3.0_Log_In/Login_3_B.dart';
import 'package:gym_app/features/Screens/LoginScreens/Forgot_and_Reset_Password/A_3.1_Forgotten_Password.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/button.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/name__for__text_field.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/text_fields.dart';
import 'package:gym_app/features/Widgets/Widgets_Login/text_fields__passwords.dart';
import 'package:gym_app/features/Screens/set_up/presentation/screens_Setup/setup_screen.dart';
import 'package:gym_app/core/Services/auth_apiservices.dart';
import 'package:gym_app/core/utils/colors.dart';
import '../../../Widgets/Widgets_Login/sign_up__icons.dart';

class Login_3_A extends StatelessWidget {
  const Login_3_A({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double Screenheight = MediaQuery.of(context).size.height;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColors,
        foregroundColor: AppColors.buttonandIConColor,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_left_outlined,
        //     size: Screenheight * 0.04,
        //   ),
        //   color: AppColors.buttonandIConColor,
        // ),
        centerTitle: true,
        title: Text(
          "Log In",
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
            Text("Welcome",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: Screenheight * 0.03,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: Screenheight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenWidth * 0.1),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                style: GoogleFonts.leagueSpartan(
                    color: Colors.white,
                    fontSize: Screenheight * 0.015,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Screenheight * 0.1),
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
                      Name: "Username or email", ScreenWidth: ScreenWidth),
                  TextFields(
                    controller: emailController,
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                  Name_For_TextField(
                      Name: "Password", ScreenWidth: ScreenWidth),
                  TextFields_Passwords(
                    controller: passwordController,
                      ScreenWidth: ScreenWidth, Screenheight: Screenheight),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenWidth * 0.57),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ForgotenPassword();
                          },
                        ));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.poppins(
                          fontSize: Screenheight * 0.014,
                          color: AppColors.backgroundColors,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Screenheight * 0.05),
            Button(
                Screenheight: Screenheight,
                NameButton: "Log In",
                onPressed: (){

                    Apiservices().login(context, emailController.text, passwordController.text);
                },
                ),
            SizedBox(height: Screenheight * 0.04),
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
                  'Don’t have an account?',
                  style: TextStyle(
                      color: AppColors.TextColor, fontWeight: FontWeight.w300),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MotivationScreen(),
                  ),
                );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: AppColors.buttonandIConColor,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
