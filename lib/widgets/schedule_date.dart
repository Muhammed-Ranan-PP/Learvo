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
    final textColor = isSelected
        ? Colors.white
        : Color.fromARGB(255, 26, 40, 86);

    return Container(
      width: 40,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? Color.fromARGB(255, 139, 92, 246)
            : Color.fromARGB(0, 0, 0, 0),
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
