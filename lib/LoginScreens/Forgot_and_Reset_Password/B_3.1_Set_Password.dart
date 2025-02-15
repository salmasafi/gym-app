import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/LoginScreens/Forgot_and_Reset_Password/C_3.1_Set_Your_Fingerprint.dart';
import 'package:gym_app/Widgets/Widgets.dart';

class setPassword extends StatelessWidget {
  const setPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    double Screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF232323),
      appBar: AppBar(
        backgroundColor: Color(0xFF232323),
        foregroundColor: Color(0xFFE2F163),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_left_outlined,
            size: Screenheight * 0.04,
          ),
          color: Color(0xFFE2F163),
        ),
        centerTitle: true,
        title: Text(
          "set Password",
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
            SizedBox(height: Screenheight * 0.05),
            Container(
              padding: EdgeInsets.symmetric(vertical: Screenheight * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFB3A0FF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            SizedBox(height: Screenheight * 0.05),
            Button(
              Screenheight: Screenheight,
              NameButton: "Reset Password",
              Location: fingerPrint(),
            ),
            SizedBox(height: Screenheight * 0.04),
          ],
        ),
      ),
    );
  }
}
