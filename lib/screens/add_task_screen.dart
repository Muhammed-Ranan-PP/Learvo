import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: 
      SingleChildScrollView(child: 
      SafeArea(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Task Title*",
                  style: TextStyle(
                    color: Color(0xFF1A2856),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "e.g. Calculus Revision",
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
                  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Task Title*",
                  style: TextStyle(
                    color: Color(0xFF1A2856),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "e.g. Calculus Revision",
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
                 SizedBox(
                height: 14,
              ),
                  Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Task Title*",
                  style: TextStyle(
                    color: Color(0xFF1A2856),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "e.g. Calculus Revision",
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
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
