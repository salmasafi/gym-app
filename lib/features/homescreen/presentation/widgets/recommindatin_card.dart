import 'package:flutter/material.dart';
class recommindation_card extends StatelessWidget {
  const recommindation_card({
    super.key,
    required this.title,
    required this.duration,
    required this.kcal,
    required this.imageUrl,
  });

  final String title;
  final String duration;
  final String kcal;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text("$duration • $kcal",
                    style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
