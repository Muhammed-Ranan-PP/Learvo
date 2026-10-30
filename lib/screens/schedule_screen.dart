import 'package:flutter/material.dart';
import 'package:learvo/widgets/schedule_date.dart';
import 'package:learvo/widgets/task_card.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Study Schedule",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 40, 86),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Color.fromARGB(255, 26, 40, 86),
                        size: 29,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ScheduleDate(day: "Mon", date: "15", isSelected: false),
                    ScheduleDate(day: "Tue", date: "16", isSelected: true),
                    ScheduleDate(day: "Wed", date: "17", isSelected: false),
                    ScheduleDate(day: "Thur", date: "18", isSelected: false),
                    ScheduleDate(day: "Fri", date: "19", isSelected: false),
                    ScheduleDate(day: "Sat", date: "20", isSelected: false),
                    ScheduleDate(day: "Sun", date: "21", isSelected: false),
                  ],
                ),
                SizedBox(height: 32),
                TaskCard(
                  title: "Maths - Chapter 4",
                  time: "09:00 AM - 10:30 AM",
                  icon: Icons.calculate_outlined,
                  iconColor: Color.fromARGB(255, 22, 139, 255),
                  statusColor: Color.fromARGB(255, 22, 163, 74),
                  isCompleted: false,
onTap: () {},
                ),
                SizedBox(height: 12),
                TaskCard(
                  title: "Physics - Numericals",
                  time: "11:00 AM - 12:00 PM",
                  icon: Icons.biotech,
                  iconColor: Color.fromARGB(255, 139, 92, 246),
                  statusColor: Color.fromARGB(255, 203, 213, 225),
                  isCompleted: false,
onTap: () {},
                ),
                SizedBox(height: 12),
                TaskCard(
                  title: "English - Essay Writing",
                  time: "02:00 PM - 03:00 PM",
                  icon: Icons.menu_book_outlined,
                  iconColor: Color.fromARGB(255, 220, 38, 38),
                  statusColor: Color.fromARGB(255, 203, 213, 225),
                  isCompleted: false,
onTap: () {},
                ),
                SizedBox(height: 12),
                TaskCard(
                  title: "Chemistry - Revision",
                  time: "05:00 PM - 06:00 PM",
                  icon: Icons.science_outlined,
                  iconColor: Color.fromARGB(255, 234, 179, 8),
                  statusColor: Color.fromARGB(255, 203, 213, 225),
                  isCompleted: false,
onTap: () {},
                ),
                SizedBox(height: 32),
                Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Sessions",
                              style: TextStyle(
                                color: Color.fromARGB(255, 100, 116, 139),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "4",
                              style: TextStyle(
                                color: Color.fromARGB(255, 26, 40, 86),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.bar_chart,
                        color: Color.fromARGB(255, 139, 92, 246),
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
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
