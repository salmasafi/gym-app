import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.Screenheight,
    required this.NameButton,
    this.onPressed,
  });

  final double Screenheight;
  final String NameButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(Screenheight * 0.25, Screenheight * 0.05),
        shadowColor: Color(0x00000040),
        backgroundColor: Color(0x0fffffff).withOpacity(0.09),
      ),
      onPressed: onPressed,
      child: Text(
        NameButton,
        style: TextStyle(
            fontFamily: "Poppins",
            color: Color(0xFFFFFFFF),
            fontSize: Screenheight * 0.02,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
