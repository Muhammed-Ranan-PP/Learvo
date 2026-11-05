import 'package:flutter/material.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/routes/app_routes.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Task task;

  const NoteDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Details"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Delete Note?"),
                  content: Text("Are you sure you want to delete this note?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () async {
                        await task.delete();

                        if (!context.mounted) return;

                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.editNote, arguments: task);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color.fromARGB(255, 226, 232, 240),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title : ${task.title}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 26, 40, 86),
                        ),
                      ),

                      SizedBox(height: 12),

                      Text(
                        "Subject : ${task.subject}",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 139, 92, 246),
                        ),
                      ),

                      SizedBox(height: 16),

                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Color.fromARGB(255, 100, 116, 139),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Date : ${task.date}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 100, 116, 139),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 26, 40, 86),
                  ),
                ),

                SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color.fromARGB(255, 226, 232, 240),
                    ),
                  ),
                  child: Text(
                    task.notes,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Color.fromARGB(255, 100, 116, 139),
                    ),
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
