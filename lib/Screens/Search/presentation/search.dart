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
      backgroundColor: AppColors.backgroundColors,
      body: Padding(
        padding: const EdgeInsets.only(top: 65, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(screenWidth: screenWidth),
            const SizedBox(height: 20),
            SearchBar(),
            const SizedBox(height: 20),
            FilterButtons(
              selectedCategory: selectedCategory,
              onCategoryChanged: (category) {
                setState(() => selectedCategory = category);
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Top Searches",
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 24,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: (topSearches[selectedCategory] ?? [])
                  .map((search) => SearchItem(search))
                  .toList(),
            ),
            const SizedBox(height: 20),
            Expanded(child: ContentList()),
          ],
        ),
      ),
    );
  }
}

// 🔹 Header Component
class Header extends StatelessWidget {
  final double screenWidth;

  const Header({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_left_outlined,
            color: AppColors.secondaryColor, size: 30),
        const SizedBox(width: 10),
        Text(
          "Search",
          style: TextStyle(
            color: AppColors.TextColor,
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.07,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Icon(Icons.notifications, color: AppColors.TextColor, size: 30),
        const SizedBox(width: 20),
        Icon(Icons.person, color: AppColors.TextColor, size: 30),
      ],
    );
  }
}

// 🔹 Search Bar Component
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: const TextStyle(color: Colors.black, fontSize: 16),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
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

// 🔹 Filter Buttons Component
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
                color: AppColors.TextColor),
          ),
        );
      }).toList(),
    );
  }
}

// 🔹 Search Item Component
class SearchItem extends StatelessWidget {
  final String title;

  const SearchItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.yellow),
            child: const Icon(Icons.search, color: Colors.purple, size: 30),
          ),
          const SizedBox(width: 10),
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}

// 🔹 Content List Component
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.only(left: 10),
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
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled_rounded,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${content[index]["time"]}",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department_outlined,
                                color: Colors.black,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "${content[index]["calories"]}",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                            ],
                          ),
                          if (content[index]["excercise"] != null &&
                              content[index]["excercise"]
                                  .toString()
                                  .trim()
                                  .isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.directions_run_rounded,
                                  color: Colors.black,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${content[index]["excercise"]}",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ],
                            ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                        child: Image.asset(
                          content[index]["image"].toString(),
                          fit: BoxFit.fill,
                          width: 160,
                          height: 150,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                          size: 28,
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
    );
  }
}

// 🔹 Bottom Navigation Bar Component
