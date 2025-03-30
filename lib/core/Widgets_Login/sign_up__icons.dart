import 'package:flutter/material.dart';

class SignUp_Icons extends StatelessWidget {
  const SignUp_Icons({
    super.key,
    required this.Screenheight,
    required this.ScreenWidth,
    required this.Images,
    this.onTap,
  });

  final double Screenheight;
  final double ScreenWidth;
  final String Images;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
