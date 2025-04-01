import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/Widgets/widgets_Settings/NavBar.dart';

void main() {
  runApp(const MaterialApp(
    home: Bsetting(),
  ));
}

class Bsetting extends StatefulWidget {
  const Bsetting({super.key});

  @override
  _BsettingState createState() => _BsettingState();
}

class _BsettingState extends State<Bsetting> {
  final TextStyle textStyle =
      TextStyle(fontSize: 20, color: AppColors.whiteColor);
  final List<String> settings = [
    'General Notifications',
    'Sound',
    'Don’t Disturb Mode',
    'Vibrate',
    'Lock Screen',
    'Reminders',
  ];

  final Map<String, bool> switchValues = {
    'General Notifications': false,
    'Sound': false,
    'Don’t Disturb Mode': false,
    'Vibrate': false,
    'Lock Screen': false,
    'Reminders': false,
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          icon: Image.asset('assets/icons/Arrow.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notifications Settings",
          style: TextStyle(color: AppColors.purple),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, 
                vertical: screenHeight * 0.02, 
              ),
              itemCount: settings.length,
              itemBuilder: (context, index) {
                String setting = settings[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02), 
                  child: ListTile(
                    title: Text(setting, style: textStyle),
                    trailing: Switch(
                      value: switchValues[setting]!,
                      onChanged: (bool newValue) {
                        setState(() {
                          switchValues[setting] = newValue;
                        });
                      },
                      activeColor: AppColors.purple,
                      inactiveTrackColor: AppColors.secondaryColor,
                      inactiveThumbColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          NavBar(screenHeight: screenHeight),
        ],
      ),
    );
  }
}
