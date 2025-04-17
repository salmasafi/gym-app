import 'package:flutter/material.dart';
import 'package:gym_app/features/Screens/Screens_Exercises/SearchScreen.dart';
import 'package:gym_app/features/Screens/profil/presentation/screens/notification.dart';
import 'package:gym_app/features/Screens/profil/presentation/screens/profile.dart';

class build_header extends StatelessWidget {
  const build_header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hi, Madison",
              style: TextStyle(
                  color: Color(0xff896CFE),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text("It's time to challenge your limits.",
                style: TextStyle(color: Colors.white, fontSize: 11)),
          ],
        ),
        Row(
          children: [
            // IconButton(
            //   icon: Icon(Icons.search, color: Color(0xff896CFE)),
            //   onPressed: () {
            
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.person, color: Color(0xff896CFE)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SixdotOneProfileScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Color(0xff896CFE)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreenWorkout(),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
