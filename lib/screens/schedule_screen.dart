
import 'package:flutter/material.dart';
import 'package:learvo/widgets/schedule_date.dart';
import 'package:learvo/widgets/task_card.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/services/task_services.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectedDate = DateTime.now();
  final TaskServices taskServices = TaskServices();

  List<DateTime> getWeekDates() {
    DateTime firstDay = selectedDate.subtract(
      Duration(days: selectedDate.weekday - 1),
    );

    return List.generate(7, (index) => firstDay.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Task>("tasks").listenable(),
      builder: (context, box, child) {
        List<Task> selectedTasks = [];

        for (var task in taskServices.taskBox.values) {
          DateTime taskDate;

          if (task.date.length == 8 && task.date[2] == "-") {
            taskDate = DateTime(
              2000 + int.parse(task.date.substring(6, 8)),
              int.parse(task.date.substring(3, 5)),
              int.parse(task.date.substring(0, 2)),
            );
          } else if (task.date.length == 10 && task.date[2] == "/") {
            taskDate = DateTime(
              int.parse(task.date.substring(6, 10)),
              int.parse(task.date.substring(3, 5)),
              int.parse(task.date.substring(0, 2)),
            );
          } else {
            continue;
          }

          if (taskDate.year == selectedDate.year &&
              taskDate.month == selectedDate.month &&
              taskDate.day == selectedDate.day) {
            selectedTasks.add(task);
          }
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
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
                      children: getWeekDates().map((date) {
                        List<String> days = [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thur",
                          "Fri",
                          "Sat",
                          "Sun",
                        ];

                        return ScheduleDate(
                          day: days[date.weekday - 1],
                          date: date.day.toString(),
                          isSelected: date.day == selectedDate.day &&
                              date.month == selectedDate.month &&
                              date.year == selectedDate.year,
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 32),
                    if (selectedTasks.isEmpty)
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "No tasks scheduled for this day",
                          style: TextStyle(
                            color: Color.fromARGB(255, 100, 116, 139),
                          ),
                        ),
                      )
                    else
                      ...selectedTasks.map((task) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: TaskCard(
                            title: "${task.subject} - ${task.title}",
                            time: task.time,
                            icon: Icons.menu_book_outlined,
                            iconColor: Color.fromARGB(255, 139, 92, 246),
                            statusColor: task.isCompleted
                                ? Color.fromARGB(255, 22, 163, 74)
                                : Color.fromARGB(255, 203, 213, 225),
                            isCompleted: task.isCompleted,
                            onTap: () {},
                          ),
                        );
                      }),
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
                                  selectedTasks.length.toString(),
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
      },
    );
  }
}

