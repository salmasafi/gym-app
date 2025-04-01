import 'package:flutter/material.dart';
import 'package:gym_app/Widgets/widgets_home/article_card.dart';
import 'package:gym_app/Widgets/widgets_home/build_header.dart';
import 'package:gym_app/Widgets/widgets_home/category_item.dart';
import 'package:gym_app/Widgets/widgets_home/navigation_item.dart';
import 'package:gym_app/Widgets/widgets_home/recommindatin_card.dart';
import 'package:gym_app/Widgets/widgets_home/weekly_chalenge_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xffB3A0FF), // Light purple color
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigation_item(icon: Icons.home, index: 0),
            navigation_item(icon: Icons.article, index: 1),
            navigation_item(icon: Icons.star_rounded, index: 2),
            navigation_item(icon: Icons.support_agent, index: 3),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: 386,
                child: Container(
                  height: 181,
                  width: 393,
                  decoration: BoxDecoration(color: Color(0xffB3A0FF)),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 61),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  build_header(),
                  const SizedBox(height: 18),
                  _buildCategoryButtons(),
                  const SizedBox(height: 20),
                  _buildRecommendations(),
                  const SizedBox(height: 45),
                  Positioned(
                    top: 413,
                    child: WeeklyChallengeCard(),
                  ),
                  const SizedBox(height: 20),
                  Positioned(
                    top: 611,
                    child: _buildArticlesAndTips(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    /*Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar:  Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFD0A8FF), // Light purple color
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navigation_item(icon: Icons.home, index: 0),
            navigation_item(icon: Icons.article, index: 1),
            navigation_item(icon: Icons.star, index: 2),
            navigation_item(icon: Icons.support_agent, index: 3),
          ],
        ),
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
                  const SizedBox(height: 8),
                  _buildArticlesAndTips(),

                ],
              ),
            ),
          ],
        ),
      ),
    );*/
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
        //const SizedBox(height: 10),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              recommindation_card(
                  title: "  Squat Exercise",
                  duration: "12 Minutes",
                  kcal: "120 Kcal",
                  imageUrl: "assets/images/women.jpg"),
              recommindation_card(
                  title: "  Full Body Stretching",
                  duration: "12 Minutes",
                  kcal: "120 Kcal",
                  imageUrl: "assets/images/home2.jpg"),
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
        SizedBox(
          height: 175,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              article_card(
                  title: "Supplement Guide",
                  imageUrl: "assets/images/article1.jpg"),
              article_card(
                  title: "Quick & Effective Routines",
                  imageUrl: "assets/images/article2.jpg"),
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
            style: const TextStyle(
                color: Color(0xffE2F163),
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins")),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Text(
                'See All',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.arrow_right, color: Color(0xffE2F163))
            ],
          ),
        )
      ],
    );
  }
}
