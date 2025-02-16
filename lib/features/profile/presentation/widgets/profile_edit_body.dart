import 'package:flutter/material.dart';
class ProfileEditBody extends StatelessWidget {
  const ProfileEditBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width:393,
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

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      color: Color(0xff896CFE),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("75 Kg"), Text("Wieght"),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("28"), Text("Years Old"),
                            ],
                          ),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("1.65 CM"), Text("Height"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
        /*SizedBox(height: 30,),
        buildMenuItem(Icons.person, "Profile"),
        buildMenuItem(Icons.star_rounded, "Favorite"),
        buildMenuItem(Icons.lock_rounded, "Privacy Policy"),
        buildMenuItem(Icons.settings, "Settings"),
        buildMenuItem(Icons.phone_callback_sharp, "Help"),
        buildMenuItem(Icons.exit_to_app_rounded, "Logout")*/

      ],
    );
  }
}
