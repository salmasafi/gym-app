import 'package:flutter/material.dart';
import 'package:gym_app/Screens/profil/presentation/screens/notification.dart';
import 'package:gym_app/Screens/profil/presentation/screens/profile.dart';
import 'package:gym_app/Widgets/Widgets_Exercise/SearchButton.dart';

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
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text("It's time to challenge your limits.",
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
        Row(
          children: [
            SearchButton(),
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
