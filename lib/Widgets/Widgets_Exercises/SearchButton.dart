import 'package:flutter/material.dart';
import 'package:gym_app/Screens/Screens_Exercises/SearchScreen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search, color: Color(0xFF896CFE), size: 30),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const SearchScreen_Exercise()),
        );
      },
    );
  }
}
