import 'package:flutter/material.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:learvo/widgets/subject_performance.dart';
import 'package:learvo/services/task_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/task_model.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final TaskServices taskServices = TaskServices();
  String selectedPeriod = "This Week";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Task>("tasks").listenable(),
        builder: (context, box, child) {
          List<Task> periodTasks = taskServices.getTasksByPeriod(
            selectedPeriod,
          );
          int totalTasks = periodTasks.length;
          int completedTasks = 0;
          for (var task in periodTasks) {
            if (task.isCompleted) {
              completedTasks++;
            }
          }
          int pendingTasks = totalTasks - completedTasks;
          double progress = totalTasks == 0 ? 0.0 : completedTasks / totalTasks;
          List<String> subjects = [];
          for (var task in periodTasks) {
            if (!subjects.contains(task.subject)) {
              subjects.add(task.subject);
            }
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Progress",
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 40, 86),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPeriod = "This Week";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedPeriod == "This Week"
                                      ? Color.fromARGB(255, 26, 40, 86)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "This Week",
                                    style: TextStyle(
                                      color: selectedPeriod == "This Week"
                                          ? Colors.white
                                          : Color.fromARGB(255, 148, 163, 184),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPeriod = "This Month";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedPeriod == "This Month"
                                      ? Color.fromARGB(255, 26, 40, 86)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "This Month",
                                    style: TextStyle(
                                      color: selectedPeriod == "This Month"
                                          ? Colors.white
                                          : Color.fromARGB(255, 148, 163, 184),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedPeriod = "This Year";
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: selectedPeriod == "This Year"
                                      ? Color.fromARGB(255, 26, 40, 86)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "This Year",
                                    style: TextStyle(
                                      color: selectedPeriod == "This Year"
                                         ? Colors.white
                                          : Color.fromARGB(255, 148, 163, 184),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 6.5,
                                constraints: BoxConstraints.expand(),
                                color: Color.fromARGB(255, 139, 92, 246),
                              ),
                              Text(
                                "${(progress * 100).round()}%",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 26, 40, 86),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 94),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("🟢  Completed"),
                            Text(" $completedTasks"),
                            SizedBox(height: 12),
                            Text("🔴  Pending"),
                            Text(" $pendingTasks"),
                            SizedBox(height: 12),
                            Text("🔵  Total Tasks"),
                            Text(" $totalTasks"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subject Performance",
                          style: TextStyle(
                            color: Color.fromARGB(255, 26, 40, 86),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "View all ",
                          style: TextStyle(
                            color: Color.fromARGB(255, 139, 92, 246),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: subjects.map((subject) {
                        double subjectProgress = taskServices
                            .getSubjectProgressByPeriod(
                              subject,
                              selectedPeriod,
                            );

                        return SubjectPerformance(
                          subject: subject,
                          percentage: "${(subjectProgress * 100).round()}%",
                          icon: Icons.menu_book_outlined,
                          iconColor: Color.fromARGB(255, 22, 139, 255),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 62),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 233, 223, 255),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_events,
                            color: Color.fromARGB(255, 139, 92, 246),
                            size: 30,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Small steps create \n big results! Keep going! ",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 100, 116, 139),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.schedule);
          } else if (index == 3) {
            Navigator.pushNamed(context, AppRoutes.profile);
          }
        },
      ),
    );
  }
}
