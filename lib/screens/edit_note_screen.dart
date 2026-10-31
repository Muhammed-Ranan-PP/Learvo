import 'package:flutter/material.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/widgets/Task_input.dart';
import 'package:learvo/widgets/priority_option.dart';

class EditScreen extends StatefulWidget {
  final Task task;
  const EditScreen({super.key, required this.task});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController titleController;
  late TextEditingController subjectController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController notesController;
  String selectedPriority = "Medium";
  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.task.title);
    subjectController = TextEditingController(text: widget.task.subject);
    dateController = TextEditingController(text: widget.task.date);
    timeController = TextEditingController(text: widget.task.time);
    notesController = TextEditingController(text: widget.task.notes);

    selectedPriority = widget.task.priority;
  }

  @override
  void dispose() {
    titleController.dispose();
    subjectController.dispose();
    dateController.dispose();
    timeController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Task")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                TaskInput(
                  label: "Task Title*",
                  hint: "Enter task title",
                  icon: Icons.description_outlined,
                  controller: titleController,
                ),
                SizedBox(height: 17),

                TaskInput(
                  label: "Subject*",
                  hint: "Enter subject",
                  icon: Icons.book_outlined,
                  controller: subjectController,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Date*",
                  hint: "Enter date",
                  icon: Icons.event_available_outlined,
                  controller: dateController,
                ),
                SizedBox(height: 17),
                TaskInput(
                  label: "Time*",
                  hint: "Enter time",
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
                    hintText: "Edit your note...",
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
                    onPressed: () async {
                      if (titleController.text.trim().isEmpty ||
                          subjectController.text.trim().isEmpty ||
                          dateController.text.trim().isEmpty ||
                          timeController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please fill in all required fields"),
                          ),
                        );
                        return;
                      }

                      widget.task.title = titleController.text.trim();
                      widget.task.subject = subjectController.text.trim();
                      widget.task.date = dateController.text.trim();
                      widget.task.time = timeController.text.trim();
                      widget.task.priority = selectedPriority;
                      widget.task.notes = notesController.text.trim();

                      await widget.task.save();

                      if (!mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Task updated successfully")),
                      );

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 26, 40, 86),
                      foregroundColor: Colors.white,
                    ),
                    child: Text("Save Changes"),
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
