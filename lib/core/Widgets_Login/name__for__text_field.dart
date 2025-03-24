import 'package:flutter/material.dart';

class Name_For_TextField extends StatelessWidget {
  const Name_For_TextField(
      {super.key, required this.ScreenWidth, required this.Name});

  final double ScreenWidth;
  final String Name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: ScreenWidth * 0.14),
      child: Text(Name,
          style: TextStyle(
              fontSize: ScreenWidth * 0.035,
              fontFamily: 'League Spartan',
              color: Color(0xFF232323),
              fontVariations: [
                FontVariation('ital', 0),
                FontVariation('wght', 500)
              ])),
    );
  }
}
