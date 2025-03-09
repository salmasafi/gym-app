import 'package:flutter/material.dart';

class navigation_item extends StatelessWidget {
  const navigation_item({
    super.key,
    required this.icon,
    required this.index,
  });

  final IconData icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
