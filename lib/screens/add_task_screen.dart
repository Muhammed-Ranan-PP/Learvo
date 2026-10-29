import 'package:flutter/material.dart';
import 'package:learvo/widgets/Task_input.dart';
import 'package:learvo/widgets/priority_option.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/services/task_services.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskServices taskServices = TaskServices();
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final notesController = TextEditingController();
  String selectedPriority = "Medium";
  @override
  void dispose() {
    titleController.dispose();
    subjectController.dispose();
    dateController.dispose();
    timeController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> saveTask() async {
    if (titleController.text.trim().isEmpty ||
        subjectController.text.trim().isEmpty ||
        dateController.text.trim().isEmpty ||
        timeController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all required fields")),
      );
      return;
    }
    Task newTask = Task(
      title: titleController.text.trim(),
       subject: subjectController.text.trim(),
        date: dateController.text.trim(),
         time: timeController.text.trim(),
          priority: selectedPriority,
           notes: notesController.text.trim());
           await taskServices.addTask(newTask);
           if(!mounted)return;

           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task saved Sucessfully")));
           Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 26, 40, 86),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Add New Task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 40, 86),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: Color.fromARGB(255, 26, 40, 86),
                      ),
                    ),
                  ],
                ),
                TaskInput(
                  label: "Task Title*",
                  hint: "e.g. Calculus Revision",
                  icon: Icons.description_outlined,
                  controller: titleController,
                ),
                SizedBox(height: 17.4),
                TaskInput(
                  label: "Subject*",
                  hint: "Maths",
                  icon: Icons.school_outlined,
                  controller: subjectController,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Date*",
                  hint: "12 Oct 2026 ",
                  icon: Icons.event_available_outlined,
                  controller: dateController,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Time*",
                  hint: "09:00 AM",
                  icon: Icons.access_time,
                  controller: timeController,
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Priority",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 40, 86),
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
                      backgroundColor: Color.fromARGB(255, 217, 251, 229),
                      borderColor: Color.fromARGB(255, 134, 239, 172),
                      textColor: Color.fromARGB(255, 22, 163, 74),
                      onTap: () {
                        setState(() {
                          selectedPriority = "Low";
                        });
                      },
                      isSelected: selectedPriority == "Low",
                    ),
                    PriorityOption(
                      label: "Medium",
                      backgroundColor: Color.fromARGB(255, 255, 246, 204),
                      borderColor: Color.fromARGB(255, 253, 224, 71),
                      textColor: Color.fromARGB(255, 234, 179, 8),
                      onTap: () {
                        setState(() {
                          selectedPriority = "Medium";
                        });
                      },
                      isSelected: selectedPriority == "Medium",
                    ),
                    PriorityOption(
                      label: "High",
                      backgroundColor: Color.fromARGB(255, 252, 228, 244),
                      borderColor: Color.fromARGB(255, 249, 168, 212),
                      textColor: Color.fromARGB(255, 220, 38, 38),
                      onTap: () {
                        setState(() {
                          selectedPriority = "High";
                        });
                      },
                      isSelected: selectedPriority == "High",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notes (Optional)",
                    style: TextStyle(
                      color: Color.fromARGB(255, 26, 40, 86),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: notesController,
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
                    onPressed: 
                      saveTask,
              
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 26, 40, 86),
                      foregroundColor: Colors.white,
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
