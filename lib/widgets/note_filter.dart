import 'package:flutter/material.dart';

class NoteFilter extends StatelessWidget {
  final String label;
  final bool isSelected;
  const NoteFilter({
    super.key,
  required this.label,
  required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? Color(0xFF1A2856)
            : Color(0xFFDCEBFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected
              ? Color(0xFFFFFFFF)
              : Color(0xFF1A2856),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ) ;
  }
}