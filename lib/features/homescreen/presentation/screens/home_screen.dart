import 'package:flutter/material.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/build_header.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/recommindatin_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              build_header(),
              const SizedBox(height: 20),
              _buildCategoryButtons(),
              const SizedBox(height: 20),
              _buildRecommendations(),
              const SizedBox(height: 20),
              _buildWeeklyChallenge(),
              const SizedBox(height: 20),
              _buildArticlesAndTips(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _categoryItem("Workout", Icons.fitness_center),
        _categoryItem("Progress", Icons.bar_chart),
        _categoryItem("Nutrition", Icons.restaurant),
        _categoryItem("Community", Icons.group),
      ],
    );
  }

  Widget _categoryItem(String title, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.green, size: 30),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Recommendations"),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              recommindation_card(title: "Squat Exercise", duration: "12 Minutes", kcal: "120 Kcal", imageUrl: "assets/images/women.jpg"),
              recommindation_card(title: "Full Body Stretching", duration: "12 Minutes", kcal: "120 Kcal", imageUrl: "assets/images/home2.jpg"),
            ],
          ),
        )
      ],
    );
  }


  Widget _buildWeeklyChallenge() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Weekly Challenge",
                    style: TextStyle(color: Colors.yellow, fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Plank With Hip Twist",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network("https://source.unsplash.com/100x100/?plank", width: 100, height: 80, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget _buildArticlesAndTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader("Articles & Tips"),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _articleCard("Supplement Guide", "https://source.unsplash.com/200x200/?supplements"),
              _articleCard("Quick & Effective Routines", "https://source.unsplash.com/200x200/?workout"),
            ],
          ),
        )
      ],
    );
  }

  Widget _articleCard(String title, String imageUrl) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("See All", style: TextStyle(color: Colors.blue, fontSize: 14)),
      ],
    );
  }
}
