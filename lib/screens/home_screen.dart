import 'package:flutter/material.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:learvo/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 100, 116, 139),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Muhammed Ranan",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 26, 40, 86),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Friday, 09 October",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 100, 116, 139),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Transform.translate(
                    offset: Offset(-10, 45),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Color.fromARGB(255, 26, 40, 86),
                      size: 40,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 26, 40, 86),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Today's Progress",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30, top: 20),
                            child: SizedBox(
                              width: 85,
                              height: 85,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    value: 0.65,
                                    strokeWidth: 6.5,
                                    constraints: BoxConstraints.expand(),
                                    color: Color.fromARGB(255, 139, 92, 246),
                                  ),
                                  Text(
                                    "65%",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "3 of 5 tasks completed",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Keep going! you're doing great",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 209, 213, 219),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17, top: 13, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's Tasks",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 40, 86),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "view all",
                      style: TextStyle(
                        color: Color.fromARGB(255, 139, 92, 246),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TaskCard(
                title: "Maths - Chapter 4",
                time: "09:00 AM - 10:30 AM",
                icon: Icons.calculate_outlined,
                iconColor: Color.fromARGB(255, 22, 139, 255),
                statusColor: Color.fromARGB(255, 22, 163, 74),
              ),
              SizedBox(height: 2),
              TaskCard(
                title: "Physics - Numericals",
                time: "11:00 AM - 12:00 PM",
                icon: Icons.biotech,
                iconColor: Color.fromARGB(255, 139, 92, 246),
                statusColor: Color.fromARGB(255, 203, 213, 225),
              ),
              SizedBox(height: 2),
              TaskCard(
                title: "English - Essay Writing",
                time: "02:00 PM - 03:00 PM",
                icon: Icons.menu_book_outlined,
                iconColor: Color.fromARGB(255, 220, 38, 38),
                statusColor: Color.fromARGB(255, 203, 213, 225),
              ),
              SizedBox(height: 2),
              TaskCard(
                title: "Chemistry - Revision",
                time: "05:00 PM - 06:00 PM",
                icon: Icons.science_outlined,
                iconColor: Color.fromARGB(255, 234, 179, 8),
                statusColor: Color.fromARGB(255, 203, 213, 225),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        top: 8,
                        bottom: 8,
                        right: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.notes);
                          },
                          child: Container(
                            width: 160,
                            height: 95,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.description_outlined,
                                  color: Color.fromARGB(255, 26, 40, 86),
                                  size: 24,
                                ),
                                Text(
                                  "My Notes",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 26, 40, 86),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Access your notes",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 100, 116, 139),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.addTask);
                        },
                        backgroundColor: Color.fromARGB(255, 139, 92, 246),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        shape: CircleBorder(),
                        child: Icon(Icons.add, size: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.schedule);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.progress);
          } else if (index == 3) {
            Navigator.pushNamed(context, AppRoutes.profile);
          }
        },
      ),
    );
  }
}
