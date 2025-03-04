import 'package:flutter/material.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/article_card.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/build_header.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/category_item.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/recommindatin_card.dart';
import 'package:gym_app/features/homescreen/presentation/widgets/weekly_chalenge_card.dart';

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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
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
                  WeeklyChallengeCard(),
                  const SizedBox(height: 20),
                  _buildArticlesAndTips(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        category_item(title: "Workout", icon: Icons.fitness_center),
        category_item(title: "Progress", icon: Icons.bar_chart),
        category_item(title: "Nutrition", icon: Icons.restaurant),
        category_item(title: "Community", icon: Icons.group),
      ],
    );
  }


  Widget _buildRecommendations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader("Recommendations"),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              recommindation_card(title: "  Squat Exercise", duration: "12 Minutes", kcal: "120 Kcal", imageUrl: "assets/images/women.jpg"),
              recommindation_card(title: "  Full Body Stretching", duration: "12 Minutes", kcal: "120 Kcal", imageUrl: "assets/images/home2.jpg"),
            ],
          ),
        )
      ],
    );
  }

 Widget _buildArticlesAndTips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionHeader("Articles & Tips"),
        const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              article_card(title: "Supplement Guide", imageUrl: "assets/images/home2.jpg"),
              article_card(title: "Quick & Effective Routines", imageUrl: "assets/images/home2.jpg"),
            ],
          ),
        )
      ],
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Text(
                'See All',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.arrow_right, color:Color(0xffE2F163))
            ],
          ),
        )
      ],
    );
  }
}
