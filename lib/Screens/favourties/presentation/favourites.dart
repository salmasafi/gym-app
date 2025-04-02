import 'package:flutter/material.dart';
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

  FavoriteItem({
    required this.title,
    required this.type,
    this.duration = 0,
    this.calories = 0,
    this.exercises = 0,
    required this.asset,
    this.description = "",
  });
}

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  SortBy selectedSort = SortBy.all;

  List<FavoriteItem> items = [
    FavoriteItem(
        title: "Upper Body",
        type: "video",
        duration: 60,
        calories: 1320,
        exercises: 5,
        asset: "assets/images/fav_1.png"),
    FavoriteItem(
        title: "Boost Energy \nAnd Vitality",
        type: "article",
        description:
            "Incorporating physical \nexercise into your daily \nroutine can boost",
        duration: 0,
        calories: 0,
        exercises: 0,
        asset: "assets/images/fav_2.png"),
    FavoriteItem(
        title: "Pull Out",
        type: "video",
        duration: 30,
        calories: 1210,
        exercises: 10,
        asset: "assets/images/fav_3.png"),
    FavoriteItem(
        title: "Lower Body Blast",
        type: "article",
        duration: 0,
        calories: 0,
        exercises: 0,
        description:
            "A lower body blast\nis a high-intensity\nworkout focused \non targeting",
        asset: "assets/images/fav_4.png"),
    FavoriteItem(
        title: "Avocado And\nEgg Toast",
        type: "article",
        duration: 15,
        calories: 150,
        exercises: 0,
        asset: "assets/images/fav_5.png"),
    FavoriteItem(
        title: "Loop Band \nExercises",
        type: "video",
        duration: 45,
        calories: 785,
        exercises: 5,
        asset: "assets/images/fav_6.png"),
    FavoriteItem(
        title: "Dumbbell Step Up",
        type: "video",
        duration: 12,
        calories: 1385,
        exercises: 3,
        asset: "assets/images/fav_7.png"),
    FavoriteItem(
        title: "Split Strength\nTraining",
        type: "video",
        duration: 12,
        calories: 1250,
        exercises: 5,
        asset: "assets/images/fav_8.png"),
    FavoriteItem(
        title: "Fruit Smoothie",
        type: "article",
        duration: 12,
        calories: 120,
        exercises: 0,
        asset: "assets/images/fav_9.png"),
    FavoriteItem(
        title: "Hydrate Properly",
        type: "article",
        description:
            "Stay hydrated before, \nduring, and after your \nworkouts to optimize...",
        duration: 0,
        calories: 0,
        exercises: 0,
        asset: "assets/images/fav_10.png"),
  ];

  List<FavoriteItem> get sortedItems {
    if (selectedSort == SortBy.all) {
      return items;
    } else {
      return items.where((item) => item.type == selectedSort.name).toList();
    }
  }

  void updateSort(SortBy sortBy) {
    setState(() {
      selectedSort = sortBy;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: Container(
        height: screenWidth * 0.18,
        decoration: BoxDecoration(
          color: AppColors.primaryColor, // Background color
          borderRadius: BorderRadius.circular(20), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3), // Adjust elevation effect
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20), // Clip to match rounded corners
          child: BottomNavigationBar(
            elevation: 10, // Adds elevation
            iconSize: screenWidth * 0.0875,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.whiteColor,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 3), // Adjust top/bottom padding
                  child: Icon(Icons.home_filled),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(Icons.description),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(Icons.star_rate_rounded),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(Icons.support_agent),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 60, bottom: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_left_outlined,
                      size: screenWidth * 0.08,
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
                Icon(
                  Icons.search,
                  color: AppColors.text,
                  size: screenWidth * 0.07,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.notifications,
                  color: AppColors.text,
                  size: screenWidth * 0.07,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.person,
                  color: AppColors.text,
                  size: screenWidth * 0.07,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sort By",
                  style: TextStyle(
                      color: AppColors.secondaryColor, fontFamily: "Poppins")),
              SizedBox(width: 10),
              FilterButton(
                  label: "All",
                  selected: selectedSort == SortBy.all,
                  onTap: () => updateSort(SortBy.all)),
              FilterButton(
                  label: "Video",
                  selected: selectedSort == SortBy.video,
                  onTap: () => updateSort(SortBy.video)),
              FilterButton(
                  label: "Article",
                  selected: selectedSort == SortBy.article,
                  onTap: () => updateSort(SortBy.article)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortedItems.length,
              itemBuilder: (context, index) {
                final item = sortedItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  padding: EdgeInsets.only(top: 12, right: 12, left: 12),
                  height: screenWidth * 0.35,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins")),
                          if (item.duration > 0)
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  "${item.duration} Minutes",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          if (item.calories > 0)
                            Row(
                              children: [
                                Icon(Icons.local_fire_department, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  "${item.calories} Kcal",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          if (item.exercises > 0)
                            Row(
                              children: [
                                Icon(Icons.directions_run, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  "${item.exercises} Exercises",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Text(
                                "${item.description} ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        child: Stack(
                          children: [
                            Image.asset(
                              item.asset,
                              width: screenWidth * 0.4,
                              height: screenWidth * 0.6,
                            ),
                            if (item.type == "video")
                              Positioned(
                                top: 45,
                                left: 70,
                                child: Icon(Icons.play_circle_fill,
                                    color: AppColors.text, size: 30),
                              ),
                            Positioned(
                              top: 5,
                              left: 120,
                              child: Icon(Icons.star,
                                  color: AppColors.secondaryColor, size: 30),
                            ),
                          ],
                        ),
                      ),
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
          backgroundColor: selected ? AppColors.secondaryColor : Colors.white,
        ),
        onPressed: onTap,
        child: Text(label,
            style: TextStyle(
              color: AppColors.text,
              fontFamily: "Poppins",
            )),
      ),
    );
  }
}
