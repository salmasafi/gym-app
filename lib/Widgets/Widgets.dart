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

class TextFields_Passwords extends StatelessWidget {
  const TextFields_Passwords({
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
        obscureText: true,
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

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.Screenheight,
    required this.NameButton,
    required this.Location,
  });

  final double Screenheight;
  final String NameButton;
  final Widget Location;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(Screenheight * 0.25, Screenheight * 0.05),
        shadowColor: Color(0x00000040),
        backgroundColor: Color(0x0fffffff).withOpacity(0.09),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Location;
          },
        ));
      },
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
