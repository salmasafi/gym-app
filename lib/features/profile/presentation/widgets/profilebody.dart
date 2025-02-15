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
              SizedBox( height: 30),
              Row(
                children: [
                  Icon(Icons.arrow_left),

                  Text("My Profile",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white
                  ),),
                ],
              ),
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
              Text("git ")

            ],
          ),
        ),

      ],
    );
  }
}
