import 'package:flutter/material.dart';

class SubjectPerformance extends StatelessWidget {
  final String subject;
  final String percentage;
  final IconData icon;
  final Color iconColor;
  const SubjectPerformance({
    super.key,
    required this.subject,
    required this.percentage,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          SizedBox(width: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(subject), Text(percentage)],
          ),
        ],
      ),
    );
  }
}
