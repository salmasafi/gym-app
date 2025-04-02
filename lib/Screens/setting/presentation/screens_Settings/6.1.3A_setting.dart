import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/Widgets/widgets_Settings/NavBar.dart';

void main() {
  runApp(const MaterialApp(
    home: Asetting(),
  ));
}

class Asetting extends StatelessWidget {
  const Asetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(Icons.arrow_left, color: AppColors.secondaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Setting",
          style: TextStyle(color: AppColors.purple, fontSize: 20),
        ),
      ),
    body: Column(
  children: [
    Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        children: const [
          SettingItemWidget(icon: Icons.notifications, text: "Notification"),
          SettingItemWidget(icon: Icons.key, text: "Password"),
          SettingItemWidget(icon: Icons.person, text: "Delete Account"),
        ],
      ),
    ),
    NavBar(screenHeight: MediaQuery.of(context).size.height),
  ],
),
     
    );
  }
}




class SettingItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingItemWidget({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.purple,
          child: Icon(icon, color: AppColors.whiteColor, size: 30),
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Icon(Icons.arrow_drop_down, color: AppColors.secondaryColor, size: 20),
        onTap: () {},
      ),
    );
  }
}


