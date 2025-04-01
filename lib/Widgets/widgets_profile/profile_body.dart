import 'package:flutter/material.dart';
import 'package:gym_app/Screens/profil/presentation/screens/edit_profile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 393,
          height: 320,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 289,
                color: Color(0xffB3A0FF),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_left),
                        Text(
                          "My Profile",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 125,
                      height: 125,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png"),
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
                              Text("75 Kg"),
                              Text("Wieght"),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("28"),
                              Text("Years Old"),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("1.65 CM"),
                              Text("Height"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        buildMenuItem(Icons.person, "Profile", onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileEdit(),
            ),
          );
        }),
        buildMenuItem(Icons.star_rounded, "Favorite"),
        buildMenuItem(Icons.lock_rounded, "Privacy Policy"),
        buildMenuItem(Icons.settings, "Settings"),
        buildMenuItem(Icons.phone_callback_sharp, "Help"),
        buildMenuItem(Icons.exit_to_app_rounded, "Logout",
            onTap: () => _showLogoutDialog(context))
      ],
    );
  }

  Widget buildMenuItem(IconData icon, String text, {VoidCallback? onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xff896CFE),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
      ),
      trailing: Icon(
        Icons.arrow_right,
        color: Colors.amberAccent,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.bottomCenter, // Moves dialog towards the bottom
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffB3A0FF),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 227,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Makes it compact
                children: [
                  Text("Are you sure you want to log out?",
                      textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: Color(0xff896CFE), fontSize: 20)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("Yes, logout",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
