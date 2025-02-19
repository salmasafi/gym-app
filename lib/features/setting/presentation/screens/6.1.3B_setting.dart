import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/setting/presentation/widgets/NavBar.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              itemCount: settings.length,
              itemBuilder: (context, index) {
                String setting = settings[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    title: Text(setting, style: textStyle),
                    trailing: Switch(
                      value: switchValues[setting]!,
                      onChanged: (bool newValue) {
                        setState(() {
                          switchValues[setting] = newValue;
                        });
                      },
                      activeColor: AppColors.secondaryColor,
                       inactiveTrackColor: AppColors.purple, 
                      inactiveThumbColor: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          NavBar(screenHeight: MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}
