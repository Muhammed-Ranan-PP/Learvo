import 'package:flutter/material.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/note_card.dart';
import 'package:learvo/widgets/note_filter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/task_model.dart';
import 'package:learvo/services/task_services.dart';


class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TaskServices taskServices = TaskServices();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 17.0),
                      child: Text(
                        "My Notes",
                        style: TextStyle(
                          color: Color.fromARGB(255, 26, 40, 86),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 26, 40, 86),
                    ),
                    hintText: "Search notes...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NoteFilter(label: "All", isSelected: true),
                    NoteFilter(label: "Maths", isSelected: false),
                    NoteFilter(label: "Physics", isSelected: false),
                    NoteFilter(label: "English", isSelected: false),
                    NoteFilter(label: "Chemistry", isSelected: false),
                  ],
                ),
                SizedBox(height: 32),
          ValueListenableBuilder(
            valueListenable: Hive.box<Task>("tasks").listenable(),
             builder: (context,box,child){
              List<Task>notes = taskServices.getTasksWithNotes();
              if(notes.isEmpty){
                return Text("No notes available");
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notes.length,
                itemBuilder: (context,index){
                  Task task = notes[index];

                  return NoteCard(
                    label: task.title,
                     details: "${task.subject}.${task.date}",
                      icon: Icons.menu_book_outlined,
                       iconColor: Color.fromARGB(255, 22, 139, 255),
                       onTap: () {
                         Navigator.pushNamed(context, AppRoutes.noteDetails,arguments: task);
                       },
                       );
                       
                }
                
                );
              
             })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
