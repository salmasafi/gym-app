import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width:393 ,
          height: 289,
          color: Color(0xffB3A0FF),
          child: Column(
            children: [
              Positioned(
                top: 95,
                left: 132,
                child: SizedBox(
                  width: 125,
                  height: 125,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
              Text("name"),
              Text("email.com"),
              Text("Birthday:date"),

            ],
          ),
        ),

      ],
    );
  }
}
