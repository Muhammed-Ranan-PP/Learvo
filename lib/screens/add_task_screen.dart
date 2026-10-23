import 'package:flutter/material.dart';
import 'package:learvo/screens/home_screen.dart';
import 'package:learvo/widgets/Task_input.dart';
import 'package:learvo/widgets/priority_option.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: Color(0xFF1A2856)),
                    ),
                    Expanded(
                      child: Text(
                        "Add New Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF1A2856),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Color(0xFF1A2856),
                      ),
                    ),
                  ],
                ),
                TaskInput(
                  label: "Task Title*",
                  hint: "e.g. Calculus Revision",
                  icon: Icons.description_outlined,
                ),

                SizedBox(height: 17.4),
                TaskInput(
                  label: "Subject*",
                  hint: "Maths",
                  icon: Icons.school_outlined,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Date*",
                  hint: "12 Oct 2026 ",
                  icon: Icons.event_available_outlined,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Time*",
                  hint: "09:00 AM",
                  icon: Icons.access_time,
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Priority",
                    style: TextStyle(
                      color: Color(0xFF1A2856),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriorityOption(
                      label: "Low",
                      backgroundColor: Color(0xFFD9FBE5),
                      borderColor: Color(0xFF86EFAC),
                      textColor: Color(0xFF16A34A),
                    ),
                    PriorityOption(
                      label: "Medium",
                      backgroundColor: Color(0xFFFFF6CC),
                      borderColor: Color(0xFFFDE047),
                      textColor: Color(0xFFEAB308),
                    ),
                    PriorityOption(
                      label: "High",
                      backgroundColor: Color(0xFFFCE4F4),
                      borderColor: Color(0xFFF9A8D4),
                      textColor: Color(0xFFDC2626),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notes (Optional)",
                    style: TextStyle(
                      color: Color(0xFF1A2856),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Add a short note....",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1A2856),
                      foregroundColor: Color(0xFFFFFFFF),
                    ),
                    child: Text("Save Task"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
