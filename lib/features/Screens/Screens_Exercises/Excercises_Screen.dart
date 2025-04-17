import 'package:flutter/material.dart';
import 'package:gym_app/features/Screens/Screens_Exercises/Excercise_Detail_screen.dart';
import 'package:gym_app/features/Widgets/Widgets_Exercises/SearchButton.dart';
import 'package:gym_app/core/Models/Models_Exercises/APIModels_Exercises.dart';
import 'package:gym_app/core/Services/Services_Exercises/APIServices_Exercises.dart';

class ExercisesScreen extends StatefulWidget {
  final String bodyPart;
  const ExercisesScreen({super.key, required this.bodyPart});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late Future<List<Exercise>> futureExercises;
  final ApiServices_Exercises apiService = ApiServices_Exercises();

  @override
  void initState() {
    super.initState();
    futureExercises = apiService.getExercisesByBodyPart(widget.bodyPart);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF212020),
      appBar: AppBar(
        backgroundColor: Color(0xFF212020),
        foregroundColor: Color(0xFF896CFE),
        title: Text(widget.bodyPart.toUpperCase()),
        actions: const [SearchButton()],
      ),
      body: FutureBuilder<List<Exercise>>(
        future: futureExercises,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No exercises found'));
          }

          return GridView.builder(
            padding: EdgeInsets.all(screenWidth * 0.04),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 600 ? 3 : 2,
              crossAxisSpacing: screenWidth * 0.04,
              mainAxisSpacing: screenWidth * 0.04,
              childAspectRatio: 0.8,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final exercise = snapshot.data![index];
              return Card(
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExerciseDetailScreen(exercise: exercise),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: exercise.imageUrl != null
                            ? Image.network(
                                exercise.imageUrl!,
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.fitness_center,
                                size: screenWidth * 0.15,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Text(
                          exercise.name,
                          style: TextStyle(fontSize: screenWidth * 0.035),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
