import 'package:flutter/material.dart';

class SignUp_Icons extends StatelessWidget {
  const SignUp_Icons({
    super.key,
    required this.Screenheight,
    required this.ScreenWidth,
    required this.Images,
  });

  final double Screenheight;
  final double ScreenWidth;
  final String Images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Screenheight * 0.05,
        width: ScreenWidth * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/$Images"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
