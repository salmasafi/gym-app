import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';


class NavBar extends StatelessWidget {
  final double screenHeight;

  const NavBar({super.key, required this.screenHeight});

  Widget _buildBottomNavIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.whiteColor,size: 30,),
        SizedBox(height: 5),
       
      ],
    );
  }

  Widget _buildBottomNavImage(String imagePath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 25, height: 25),
        SizedBox(height: 5),
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      color: AppColors.purple2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           
          _buildBottomNavIcon(Icons.home,''),
          _buildBottomNavIcon(Icons.switch_account,''),
          _buildBottomNavIcon(Icons.star,''),
          _buildBottomNavImage("assets/icons/Vector.png"),
        ],
      ),
    );
  }
}
