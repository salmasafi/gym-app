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
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text("It's time to challenge your limits.",
                style: TextStyle(color: Colors.white54, fontSize: 14)),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.notifications, color: Colors.white),
          ],
        )
      ],
    );
  }
}
