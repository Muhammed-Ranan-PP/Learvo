import 'package:flutter/material.dart';

class ScheduleDate extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  const ScheduleDate({
    super.key,
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? Color(0xFFFFFFFF) : Color(0xFF1A2856);
    return Container(
      width: 40,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF8B5CF6) : Color(0x00000000),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(day, style: TextStyle(color: textColor)),
          Text(
            date,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
