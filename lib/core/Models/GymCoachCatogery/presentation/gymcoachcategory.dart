import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym_app/core/utils/colors.dart';

enum SortBy { all, video, article }

class FavoriteItem {
  final String title;
  final String type;
  final int duration;
  final int calories;
  final int exercises;
  final String asset;
  final String description;
  final String categoryGym;

  FavoriteItem({
    required this.title,
    required this.type,
    this.duration = 0,
    this.calories = 0,
    this.exercises = 0,
    required this.asset,
    this.description = "",
    this.categoryGym = "",
  });
}

class Gymcoachcategory extends StatefulWidget {
  const Gymcoachcategory({super.key});

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Gymcoachcategory> {
  SortBy selectedSort = SortBy.all;
  String selectedCategory = "All";
  List<String> filterLabels = ["All"];
  bool isLoading = true;

  List<FavoriteItem> items = [
    FavoriteItem(
        title: "Upper Body",
        type: "video",
        duration: 60,
        calories: 1320,
        exercises: 5,
        asset: "assets/images/fav_1.png",
        categoryGym: "Bodybuilding"),
    FavoriteItem(
        title: "Boost Energy And Vitality",
        type: "article",
        description:
            "Incorporating physical exercise into your daily routine can boost",
        asset: "assets/images/fav_2.png",
        categoryGym: "Strength"),
    // Add more items as needed
    FavoriteItem(
        title: "Pull Out",
        type: "video",
        duration: 30,
        calories: 1210,
        exercises: 10,
        asset: "assets/images/fav_3.png",
        categoryGym: "Powerlifting"),
    FavoriteItem(
        title: "Lower Body Blast",
        type: "article",
        description:
            "A lower body blast\nis a high-intensity \nworkout focused \non targeting",
        asset: "assets/images/fav_4.png",
        categoryGym: "Bodybuilding"),
    FavoriteItem(
        title: "Avocado And\nEgg Toast",
        type: "article",
        duration: 15,
        calories: 150,
        asset: "assets/images/fav_5.png",
        categoryGym: "Nutrition"),
    FavoriteItem(
        title: "Loop and \nExercises",
        type: "video",
        duration: 45,
        calories: 785,
        exercises: 5,
        asset: "assets/images/fav_6.png",
        categoryGym: "Group"),
    FavoriteItem(
        title: "Dumbbell Step Up",
        type: "video",
        duration: 12,
        calories: 1385,
        exercises: 3,
        asset: "assets/images/fav_7.png",
        categoryGym: "Strength"),
    FavoriteItem(
        title: "Split Strength\nTraining",
        type: "video",
        duration: 12,
        calories: 1250,
        exercises: 5,
        asset: "assets/images/fav_8.png",
        categoryGym: "Strength"),
    FavoriteItem(
        title: "Fruit Smoothie",
        type: "article",
        duration: 12,
        calories: 120,
        exercises: 0,
        asset: "assets/images/fav_9.png",
        categoryGym: "Nutrition"),
    FavoriteItem(
        title: "Hydrate Properly",
        type: "article",
        description:
            "Stay hydrated before, \nduring, and after your \nworkouts to optimize...",
        duration: 0,
        calories: 0,
        exercises: 0,
        asset: "assets/images/fav_10.png",
        categoryGym: "Sports"),
  ];

  List<FavoriteItem> get sortedItems {
    return items.where((item) {
      bool matchesType =
          selectedSort == SortBy.all || item.type == selectedSort.name;
      bool matchesCategory =
          selectedCategory == "All" || item.categoryGym == selectedCategory;
      return matchesType && matchesCategory;
    }).toList();
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  Future<void> fetchFilterLabels() async {
    const String url =
        'http://www.gymfit.somee.com/api/GymCoachCategory/get-all';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          filterLabels.addAll(
              data.map<String>((json) => json['category'] as String).toList());
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load filter labels');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFilterLabels();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15, left: 15, top: 60, bottom: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_left_rounded,
                      size: screenWidth * 0.09,
                      color: AppColors.secondaryColor),
                ),
                Text(
                  "Favorites",
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: screenWidth * 0.07,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
                Spacer(),
                Icon(Icons.search,
                    color: AppColors.text, size: screenWidth * 0.07),
                SizedBox(width: 15),
                Icon(Icons.notifications,
                    color: AppColors.text, size: screenWidth * 0.07),
                SizedBox(width: 15),
                Icon(Icons.person,
                    color: AppColors.text, size: screenWidth * 0.07),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text("Sort By",
                    style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: screenWidth * 0.045)),
              ),
              SizedBox(width: 10),
              if (isLoading)
                CircularProgressIndicator()
              else
                SizedBox(
                  height: 40,
                  width: screenWidth * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filterLabels.length,
                    itemBuilder: (context, index) {
                      final label = filterLabels[index];
                      return FilterButton(
                        label: label,
                        selected: selectedCategory == label,
                        onTap: () => updateCategory(label),
                      );
                    },
                  ),
                ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortedItems.length,
              itemBuilder: (context, index) {
                final item = sortedItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  padding: EdgeInsets.all(12),
                  height: screenWidth * 0.35,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins")),
                            if (item.duration > 0)
                              Row(children: [
                                Icon(Icons.access_time,
                                    size: screenWidth * 0.04),
                                SizedBox(width: 5),
                                Text(
                                  "${item.duration} Minutes",
                                  style: TextStyle(fontFamily: "Poppins"),
                                )
                              ]),
                            if (item.calories > 0)
                              Row(children: [
                                Icon(Icons.local_fire_department,
                                    size: screenWidth * 0.04),
                                SizedBox(width: 5),
                                Text("${item.calories} Kcal",
                                    style: TextStyle(fontFamily: "Poppins"))
                              ]),
                            Text(item.description,
                                style: TextStyle(
                                    fontSize: screenWidth * 0.035,
                                    fontFamily: "Poppins")),
                          ],
                        ),
                      ),
                      Image.asset(item.asset,
                          width: screenWidth * 0.4, height: screenWidth * 0.6),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterButton(
      {super.key,
      required this.label,
      required this.selected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                selected ? AppColors.secondaryColor : Colors.white),
        onPressed: onTap,
        child: Text(label,
            style: TextStyle(color: AppColors.text, fontFamily: "Poppins")),
      ),
    );
  }
}
