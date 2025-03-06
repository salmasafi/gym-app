import 'package:flutter/material.dart';
class article_card extends StatelessWidget {
  const article_card({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 174,
      margin: const EdgeInsets.only(right: 12),
      /*decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),*/
      child: Stack(
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imageUrl,
                  width: 157,
                  height: 134,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Icon(Icons.star, color: Colors.yellow.shade700, size: 15),
          ),

        ]
      ),
    );
  }
}
