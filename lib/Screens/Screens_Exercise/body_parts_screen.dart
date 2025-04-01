import 'package:flutter/material.dart';
import 'package:gym_app/Screens/Screens_Exercise/Excercises_Screen.dart';
import 'package:gym_app/core/Logic/service/API/APIServices_Exercises.dart';

class BodyPartsScreen extends StatefulWidget {
  const BodyPartsScreen({super.key});

  @override
  State<BodyPartsScreen> createState() => _BodyPartsScreenState();
}

class _BodyPartsScreenState extends State<BodyPartsScreen> {
  late Future<List<String>> futureBodyParts;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futureBodyParts = apiService.getBodyParts();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF212020),
      body: FutureBuilder<List<String>>(
        future: futureBodyParts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No body parts found'));
          }

          return GridView.builder(
            padding: EdgeInsets.all(screenWidth * 0.04),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 600 ? 3 : 2,
              crossAxisSpacing: screenWidth * 0.04,
              mainAxisSpacing: screenWidth * 0.04,
              childAspectRatio: 1.5,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExercisesScreen(
                        bodyPart: snapshot.data![index],
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      snapshot.data![index].toUpperCase(),
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
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
