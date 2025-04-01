import 'package:flutter/material.dart';
import 'package:gym_app/models/APIModels_Exersice.dart';

class ElevatedCard extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const ElevatedCard({super.key, required this.exercise, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: exercise.imageUrl != null
                    ? Image.network(exercise.imageUrl!, fit: BoxFit.cover)
                    : Icon(Icons.fitness_center, size: screenWidth * 0.15),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                exercise.name,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                children: [
                  Icon(Icons.category, size: screenWidth * 0.04),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    exercise.bodyPart,
                    style: TextStyle(fontSize: screenWidth * 0.035),
                  ),
                ],
              ),
              if (exercise.equipment != null) ...[
                SizedBox(height: screenHeight * 0.005),
                Row(
                  children: [
                    Icon(Icons.build, size: screenWidth * 0.04),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      exercise.equipment!,
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
