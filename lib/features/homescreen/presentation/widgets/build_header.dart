import 'package:flutter/material.dart';
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
            Text("Hi, Madison",
                style: TextStyle(color: Color(0xff896CFE), fontSize: 20, fontWeight: FontWeight.bold)),
            Text("It's time to challenge your limits.",
                style: TextStyle(color: Colors.white, fontSize: 13)),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.search, color: Color(0xff896CFE)),
            SizedBox(width: 16),
            Icon(Icons.notifications, color: Color(0xff896CFE)),
            SizedBox(width: 16),
            Icon(Icons.person, color: Color(0xff896CFE)),
          ],
        )
      ],
    );
  }
}
