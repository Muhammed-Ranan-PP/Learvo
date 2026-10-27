import 'package:flutter/material.dart';

class NoteFilter extends StatelessWidget {
  final String label;
  final bool isSelected;

  const NoteFilter({super.key, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? Color.fromARGB(255, 26, 40, 86)
            : Color.fromARGB(255, 220, 235, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 26, 40, 86),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
