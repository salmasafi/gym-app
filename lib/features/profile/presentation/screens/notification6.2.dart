import 'package:flutter/material.dart';

class NotificationScreenWorkout extends StatefulWidget {
  @override
  _NotificationScreenWorkoutState createState() => _NotificationScreenWorkoutState();
}

class _NotificationScreenWorkoutState extends State<NotificationScreenWorkout> {
  int selectedTab = 0; // 0 for Reminders, 1 for System

  List<Map<String, String>> reminders = [
    {"title": "New Workout is Available", "time": "June 10 - 10:00 AM", "icon": "star"},
    {"title": "Don't Forget To Drink Water", "time": "June 10 - 8:00 AM", "icon": "lightbulb"},
    {"title": "Upper Body Workout Completed!", "time": "June 09 - 6:00 PM", "icon": "lightbulb"},
    {"title": "Remember Your Exercise Session", "time": "June 09 - 7:30 AM", "icon": "info"},
    {"title": "New Article & Tip Posted!", "time": "June 08", "icon": "article"},
  ];

  List<Map<String, String>> systemNotifications = [
    {"title": "You Started a New Challenge!", "time": "May 29 - 20XX", "icon": "flag"},
    {"title": "New House training ideas!", "time": "May 28", "icon": "New House training ideas"},
  ];

  IconData getIcon(String iconName) {
    switch (iconName) {
      case "star":
        return Icons.star_rounded;
      case "lightbulb":
        return Icons.lightbulb;
      case "info":
        return Icons.info;
      case "article":
        return Icons.article;
      case "flag":
        return Icons.flag;
      case "system_update":
        return Icons.system_update;
      default:
        return Icons.notifications;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Notifications", style: TextStyle(color: Colors.blueAccent)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blueAccent),
      ),
      body: Center(
        child: SizedBox(
          width: 323,
          child: Column(
            children: [
              // Tab Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedTab == 0 ? Colors.yellow : Colors.grey[850],
                            borderRadius: BorderRadius.circular(38),
                          ),
                          child: Center(
                            child: Text(
                              "Reminders",
                              style: TextStyle(
                                  color: selectedTab == 0 ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = 1),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedTab == 1 ? Colors.yellow : Colors.grey[850],
                            borderRadius: BorderRadius.circular(38),
                          ),
                          child: Center(
                            child: Text(
                              "System",
                              style: TextStyle(
                                  color: selectedTab == 1 ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Notification List
              Expanded(
                child: ListView(
                  children: [
                    _buildSectionTitle("Today"),
                    ..._buildNotificationList(reminders.take(2).toList()),

                    _buildSectionTitle("Yesterday"),
                    ..._buildNotificationList(reminders.skip(2).take(3).toList()),

                    _buildSectionTitle("May 29 - 20XX"),
                    ..._buildNotificationList(systemNotifications),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  List<Widget> _buildNotificationList(List<Map<String, String>> notifications) {
    return notifications
        .map(
          (data) => Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color:Colors.blue ,
              borderRadius: BorderRadius.circular(50),
            ),
              child: Icon(getIcon(data["icon"]!), color: Colors.yellow,size: 45,)),
          title: Text(data["title"]!,
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
          subtitle: Text(data["time"]!, style: TextStyle(color: Colors.black87)),
        ),
      ),
    )
        .toList();
  }
}