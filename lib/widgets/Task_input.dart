import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;

  const TaskInput({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
  });     

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromARGB(255, 26, 40, 86),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
