import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app/Presentation/LoginScreens/3.0_Log_In/Login_3_A.dart';
import 'package:gym_app/core/Widgets_Login/button.dart';

class fingerPrint extends StatelessWidget {
  const fingerPrint({super.key});

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
          "Set Your Fingerprint",
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
                height: Screenheight * 0.35,
                decoration: BoxDecoration(
                  color: Color(0xFFB3A0FF),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/Mark.png",
                    fit: BoxFit.fill,
                  ),
                )),
            SizedBox(height: Screenheight * 0.05),
            Button(
              Screenheight: Screenheight,
              NameButton: "Skip",
              Location: Login_3_A(),
            ),
            SizedBox(height: Screenheight * 0.01),
            Button(
              Screenheight: Screenheight,
              NameButton: "Continue",
              Location: Login_3_A(),
            ),
          ],
        ),
      ),
    );
  }
}
