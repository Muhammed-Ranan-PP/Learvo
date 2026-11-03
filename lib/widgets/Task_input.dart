import 'package:flutter/material.dart';

class TaskInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;

  const TaskInput({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
   this.readOnly = false,
   this.onTap,
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
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
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
