import 'package:flutter/material.dart';
import 'package:gym_app/Excersie/Widgets/SearchButton.dart';

class HelloWorldScreen extends StatelessWidget {
  const HelloWorldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        actions: const [SearchButton()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to GymFit!',
              style: TextStyle(fontSize: screenWidth * 0.06),
            ),
          ],
        ),
      ),
    );
  }
}
