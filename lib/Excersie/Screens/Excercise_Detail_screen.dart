import 'package:flutter/material.dart';
import 'package:gym_app/Excersie/Models/APIModels.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailScreen({Key? key, required this.exercise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final contentWidth = isLandscape
        ? mediaQuery.size.width * 0.7
        : mediaQuery.size.width * 0.95;

    return Scaffold(
      backgroundColor: Color(0xFF212020),
      appBar: AppBar(
        backgroundColor: Color(0xFF212020),
        foregroundColor: Color(0xFF896CFE),
        title: Text(
          exercise.name,
          style: TextStyle(fontSize: mediaQuery.size.width * 0.05),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: contentWidth,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(mediaQuery.size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (exercise.imageUrl != null)
                  Container(
                    height: isLandscape
                        ? mediaQuery.size.height * 0.4
                        : mediaQuery.size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        exercise.imageUrl!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                SizedBox(height: mediaQuery.size.height * 0.03),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: mediaQuery.size.width * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                _buildDetailRow('Body Part', exercise.bodyPart, mediaQuery),
                if (exercise.equipment != null)
                  _buildDetailRow('Equipment', exercise.equipment!, mediaQuery),
                if (exercise.target != null)
                  _buildDetailRow('Target', exercise.target!, mediaQuery),
                if (exercise.secondaryMuscles != null &&
                    exercise.secondaryMuscles!.isNotEmpty)
                  _buildDetailRow(
                    'Secondary Muscles',
                    exercise.secondaryMuscles!.join(', '),
                    mediaQuery,
                  ),
                if (exercise.instructions != null &&
                    exercise.instructions!.isNotEmpty) ...[
                  SizedBox(height: mediaQuery.size.height * 0.03),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: mediaQuery.size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.01),
                  ...exercise.instructions!.map(
                    (instruction) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: mediaQuery.size.height * 0.005,
                      ),
                      child: Text(
                        '• $instruction',
                        style: TextStyle(
                          fontSize: mediaQuery.size.width * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value,
    MediaQueryData mediaQuery,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: mediaQuery.size.width * 0.3,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: mediaQuery.size.width * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: mediaQuery.size.width * 0.04,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
