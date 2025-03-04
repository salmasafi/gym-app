import 'package:flutter/material.dart';

class category_item extends StatelessWidget {
  const category_item({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.green, size: 32),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
