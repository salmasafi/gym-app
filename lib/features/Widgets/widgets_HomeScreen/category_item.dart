import 'package:flutter/material.dart';

class category_item extends StatelessWidget {
  const category_item({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Color(0xffB3A0FF), size: 32),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
