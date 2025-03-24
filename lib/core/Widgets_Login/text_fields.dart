import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.ScreenWidth,
    required this.Screenheight,
  });

  final double ScreenWidth;
  final double Screenheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenWidth * 0.14,
        vertical: Screenheight * 0.005,
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenWidth * 0.05,
          ),
        ),
      ),
    );
  }
}
