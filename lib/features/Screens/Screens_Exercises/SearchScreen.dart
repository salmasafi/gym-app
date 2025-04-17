import 'package:flutter/material.dart';
import 'package:gym_app/features/Screens/Screens_Exercises/Excercise_Detail_screen.dart';
import 'package:gym_app/features/Screens/Screens_Exercises/body_parts_screen.dart';
import 'package:gym_app/features/Widgets/Widgets_Exercises/ElevatedCard.dart';
import 'package:gym_app/core/Models/Models_Exercises/APIModels_Exercises.dart';
import 'package:gym_app/core/Services/Services_Exercises/APIServices_Exercises.dart';

class SearchScreen_Exercise extends StatefulWidget {
  const SearchScreen_Exercise({super.key});

  @override
  State<SearchScreen_Exercise> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen_Exercise> {
  final ApiServices_Exercises apiService = ApiServices_Exercises();
  final TextEditingController _searchController = TextEditingController();
  late Future<List<Exercise>> futureExercises;
  bool _isSearching = false;
  bool _hasSearched = false;

  @override
  void initState() {
    super.initState();
    futureExercises = Future.value([]);
  }

  void _searchExercises() {
    if (_searchController.text.isEmpty) {
      setState(() => _hasSearched = false);
      return;
    }
    setState(() {
      _isSearching = true;
      _hasSearched = true;
      futureExercises = apiService
          .searchExercises(_searchController.text)
          .whenComplete(() => setState(() => _isSearching = false));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF212020),
      appBar: AppBar(
        backgroundColor: Color(0xFF212020),
        foregroundColor: Color(0xFF896CFE),
        title: TextField(
          style: TextStyle(color: Colors.white),
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search exercises...',
            hintStyle: TextStyle(color: Colors.white),
            fillColor: Colors.white,
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search, color: Color(0xFF896CFE)),
          ),
          onSubmitted: (_) => _searchExercises(),
        ),
      ),
      body: Column(
        children: [
          if (_isSearching) const LinearProgressIndicator(),
          Expanded(
            child: _hasSearched
                ? FutureBuilder<List<Exercise>>(
                    future: futureExercises,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: Text(
                            'Searching... Please wait',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            'No results found',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: screenHeight * 0.02,
                            ),
                            child: ElevatedCard(
                              exercise: snapshot.data![index],
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExerciseDetailScreen(
                                    exercise: snapshot.data![index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )
                : const BodyPartsScreen(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
