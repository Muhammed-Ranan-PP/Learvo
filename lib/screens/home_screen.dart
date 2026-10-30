import 'package:flutter/material.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:learvo/widgets/task_list.dart';
import 'package:learvo/services/home_services.dart';
import 'package:learvo/services/task_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeServices homeServices = HomeServices();
  final TaskServices taskServices = TaskServices();
  String userName = "Learvo user";
  Future<void> loadUserName() async {
    String? name = await homeServices.getUserName();

    if (name != null) {
      setState(() {
        userName = name;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadUserName();
  }

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
                            homeServices.getGreeting(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 100, 116, 139),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            userName,
                            style: TextStyle(
                              fontSize: 24,
                              color: Color.fromARGB(255, 26, 40, 86),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            homeServices.getFormattedDate(),
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

                child: ValueListenableBuilder(
                  valueListenable: Hive.box<Task>('tasks').listenable(),
                  builder: (context, box, child) {
                    int completedTasks = taskServices.getCompletedTasks();
                    int totalTasks = taskServices.getTotalTasks();
                    double progress = taskServices.getProgress();
                    int percentage = (progress * 100).toInt();
                    return Container(
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
                                        value: progress,
                                        strokeWidth: 6.5,
                                        constraints: BoxConstraints.expand(),
                                        color: Color.fromARGB(
                                          255,
                                          139,
                                          92,
                                          246,
                                        ),
                                      ),
                                      Text(
                                        "$percentage%",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                            255,
                                            255,
                                            255,
                                            255,
                                          ),
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
                                      "$completedTasks of $totalTasks tasks completed",
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Keep going! you're doing great",
                                      style: TextStyle(
                                        color: Color.fromARGB(
                                          255,
                                          209,
                                          213,
                                          219,
                                        ),
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
                    );
                  },
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
              TaskList(),
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
