import 'package:flutter/material.dart';
import 'package:gym_app/core/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = "All";

  final Map<String, List<String>> topSearches = {
    "Workout": ["Circuit", "Split", "Challenge", "Legs", "Cardio"],
    "Nutrition": ["Breakfast", "Yogurt", "Vegetarian", "Smoothie", "Chicken"],
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Container(
        height: screenWidth * 0.18,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            elevation: 10,
            iconSize: screenWidth * 0.0875,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColor,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.whiteColor,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 3),
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
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.only(
            top: screenWidth * 0.16,
            right: screenWidth * 0.05,
            left: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(screenWidth: screenWidth),
              SizedBox(height: screenWidth * 0.05),
              const SearchBar(),
              SizedBox(height: screenWidth * 0.05),
              FilterButtons(
                selectedCategory: selectedCategory,
                onCategoryChanged: (category) {
                  setState(() => selectedCategory = category);
                },
              ),
              if (selectedCategory == "All")
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.04),
                    child: const cardExercise(),
                  ),
                  ContentList(),
                ])
              else if (selectedCategory == "Workout")
                Column(
                  children: (topSearches["Workout"] ?? [])
                      .map((search) => SearchItem(search))
                      .toList(),
                )
              else if (selectedCategory == "Nutrition")
                Column(
                  children: (topSearches["Nutrition"] ?? [])
                      .map((search) => SearchItem(search))
                      .toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class cardExercise extends StatelessWidget {
  const cardExercise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExerciseCard(
          imagePath: 'assets/images/Container_image2.png',
          title: 'Squat Exercise',
          duration: '12 Minutes',
          calories: '120 Kcal',
          width: screenWidth * 0.42,
          height: screenWidth * 0.45,
        ),
        SizedBox(width: screenWidth * 0.04),
        ExerciseCard(
          imagePath: 'assets/images/Container_image1.png',
          title: 'Full Body Stretching',
          duration: '12 Minutes',
          calories: '120 Kcal',
          width: screenWidth * 0.42,
          height: screenWidth * 0.45,
        ),
      ],
    );
  }
}

class TopSearches extends StatelessWidget {
  const TopSearches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Text(
      "Top Searches",
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: screenWidth * 0.06,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class Header extends StatelessWidget {
  final double screenWidth;

  const Header({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_left_outlined,
            color: AppColors.secondaryColor, size: screenWidth * 0.075),
        SizedBox(width: screenWidth * 0.025),
        Text(
          "Search",
          style: TextStyle(
            color: AppColors.text,
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Icon(Icons.notifications,
            color: AppColors.text, size: screenWidth * 0.075),
        SizedBox(width: screenWidth * 0.05),
        Icon(Icons.person, color: AppColors.text, size: screenWidth * 0.075),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.125,
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.04),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.04,
            fontFamily: "Poppins",
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}

class FilterButtons extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const FilterButtons({
    required this.selectedCategory,
    required this.onCategoryChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ["All", "Workout", "Nutrition"].map((label) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedCategory == label
                ? AppColors.secondaryColor
                : Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: () => onCategoryChanged(label),
          child: Text(
            label,
            style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                color: AppColors.text,
                fontSize: screenWidth * 0.035),
          ),
        );
      }).toList(),
    );
  }
}

class SearchItem extends StatelessWidget {
  final String title;

  const SearchItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenWidth * 0.125,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.025),
      padding: EdgeInsets.only(left: screenWidth * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            height: screenWidth * 0.125,
            width: screenWidth * 0.125,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow),
            child: Icon(Icons.search,
                color: Colors.purple, size: screenWidth * 0.075),
          ),
          SizedBox(width: screenWidth * 0.025),
          Text(title,
              style: TextStyle(
                  fontSize: screenWidth * 0.04, fontFamily: "Poppins")),
        ],
      ),
    );
  }
}

class ContentList extends StatelessWidget {
  final List<Map<String, dynamic>> content = [
    {
      "title": "Circuit Training",
      "time": "50 Minutes",
      "calories": "1300 Kcal",
      "excercise": "5 exercises",
      "image": "assets/images/search_1.png",
    },
    {
      "title": "Delights with\n Greek yogurt",
      "time": "6 Minutes",
      "calories": "200 Cal",
      "excercise": "",
      "image": "assets/images/search_2.png",
    },
    {
      "title": "Split Strength\n Training",
      "time": "12 Minutes",
      "calories": "1250 Kcal",
      "excercise": "5 exercises",
      "image": "assets/images/search_3.png",
    },
    {
      "title": "Turkey and Avocado\n Wrap",
      "time": "15 Minutes",
      "calories": "230 Cal",
      "excercise": "",
      "image": "assets/images/search_4.png",
    },
  ];

  ContentList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.9,
      child: ListView.builder(
        itemCount: content.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
            padding: EdgeInsets.only(left: screenWidth * 0.025),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content[index]["title"],
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.0125),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            content[index]["time"] != null &&
                                    content[index]["time"]
                                        .toString()
                                        .trim()
                                        .isNotEmpty
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.access_time_filled_outlined,
                                        color: Colors.black,
                                        size: screenWidth * 0.0375,
                                      ),
                                      SizedBox(width: screenWidth * 0.0125),
                                      Text(
                                        "${content[index]["time"]}",
                                        style: TextStyle(fontFamily: "Poppins"),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            content[index]["calories"] != null &&
                                    content[index]["calories"]
                                        .toString()
                                        .trim()
                                        .isNotEmpty
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        color: Colors.black,
                                        size: screenWidth * 0.0375,
                                      ),
                                      SizedBox(width: screenWidth * 0.0125),
                                      Text(
                                        "${content[index]["calories"]}",
                                        style: const TextStyle(
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            content[index]["excercise"] != null &&
                                    content[index]["excercise"]
                                        .toString()
                                        .trim()
                                        .isNotEmpty
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.directions_run_rounded,
                                        color: Colors.black,
                                        size: screenWidth * 0.0375,
                                      ),
                                      SizedBox(width: screenWidth * 0.0125),
                                      Text(
                                        "${content[index]["excercise"]}",
                                        style: const TextStyle(
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            content[index]["image"].toString(),
                            fit: BoxFit.fill,
                            width: screenWidth * 0.38,
                            height: screenWidth * 0.375,
                          ),
                        ),
                        Positioned(
                          top: screenWidth * 0.02,
                          right: screenWidth * 0.02,
                          child: Icon(
                            Icons.star_rate_rounded,
                            color: Colors.white,
                            size: screenWidth * 0.07,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String duration;
  final String calories;
  final double width;
  final double height;

  const ExerciseCard({
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.calories,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
        ],
        border: Border.all(color: Colors.white),
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: width,
                  height: height * 0.6,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  child: Icon(
                    Icons.star,
                    color: AppColors.secondaryColor,
                    size: screenWidth * 0.05,
                  ),
                ),
                Positioned(
                  bottom: screenWidth * 0.0125,
                  right: screenWidth * 0.02,
                  child: CircleAvatar(
                    backgroundColor: AppColors.text,
                    radius: screenWidth * 0.03,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                SizedBox(height: screenWidth * 0.01),
                Row(
                  children: [
                    Icon(Icons.access_time_filled_outlined,
                        color: AppColors.text, size: screenWidth * 0.035),
                    SizedBox(width: screenWidth * 0.005),
                    Text(
                      duration,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.03,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Icon(Icons.local_fire_department,
                        color: AppColors.text, size: screenWidth * 0.035),
                    SizedBox(width: screenWidth * 0.003),
                    Text(
                      calories,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.03,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
