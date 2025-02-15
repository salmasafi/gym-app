import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width:393 ,
          height: 320,
          child: Stack(
            children: [
              Container(
                width:393 ,
                height: 289,
                color: Color(0xffB3A0FF),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Icon(Icons.arrow_left),
                        Text("My Profile",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white
                        ),),
                      ],
                    ),
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profile.png"),
                      ),
                    ),
                    Text("name"),
                    Text("email.com"),
                    Text("Birthday:date"),
                  ],
                ),
              ),
              Positioned(
                  top: 260,
                  left: 36,
                  child: Container(
                    width: 323,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xff896CFE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
