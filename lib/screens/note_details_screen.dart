import 'package:flutter/material.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/routes/app_routes.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Task task;
  const NoteDetailsScreen({
    super.key,
    required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Details"),
         actions: [
    IconButton(
      onPressed: ()  {
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
      IconButton(onPressed: (){
          Navigator.pushNamed(context, AppRoutes.editNote,
          arguments: task);
        }, icon: Icon(Icons.edit),)
  ],
  
),
      body:  Padding(
  padding: EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Task: ${task.title}"),
      Text("Subject: ${task.subject}"),
      Text("Date: ${task.date}"),
      SizedBox(height: 20),
      Text("Notes"),
      Text(task.notes),
    ],
  ),
),
    );
    
  }
}