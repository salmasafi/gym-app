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
      width: 157,
      height: 138,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),

      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 1,
            //left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    imageUrl,
                    height: 92,
                    width: 157,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Color(0xffE2F163), fontWeight: FontWeight.bold)),

                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.timer, size: 9, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(duration, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                        SizedBox(width: 4,),
                        Row(
                          children: [
                            const Icon(Icons.local_fire_department, size: 9, color: Colors.purple),
                            const SizedBox(width: 4),
                            Text(kcal, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.star, color: Colors.yellow.shade700, size: 24),
          ),
          Positioned(
            top: 70,
            left: 130,
            child: Icon(Icons.play_circle, color: Colors.blueAccent, size: 24),
          ),

        ],
      ),
    );

  }
}
