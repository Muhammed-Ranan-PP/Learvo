import 'package:flutter/material.dart';
import 'package:learvo/widgets/note_card.dart';
import 'package:learvo/widgets/note_filter.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
                NoteCard(
                  label: "Quadric Equations",
                  details: "Maths. 12 sep 2025",
                  icon: Icons.calculate_outlined,
                  iconColor: Color.fromARGB(255, 22, 139, 255),
                ),
                NoteCard(
                  label: "Atomic Structure",
                  details: "Physics. 10 sep 2025 ",
                  icon: Icons.biotech,
                  iconColor: Color.fromARGB(255, 139, 92, 246),
                ),
                NoteCard(
                  label: "Essay Format",
                  details: "English. 08 sep 2025",
                  icon: Icons.menu_book_outlined,
                  iconColor: Color.fromARGB(255, 220, 38, 38),
                ),
                NoteCard(
                  label: "Organic Chemistry",
                  details: "Chemistry. 05 seo 2025",
                  icon: Icons.calculate_outlined,
                  iconColor: Color.fromARGB(255, 22, 139, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
