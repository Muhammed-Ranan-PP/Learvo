import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String label;
  final String details;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const NoteCard({
    super.key,
    required this.label,
    required this.details,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: 
    Container(
      height: 66,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 214, 214, 214)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 226, 236, 255),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Color.fromARGB(255, 100, 116, 139),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                details,
                style: TextStyle(
                  color: Color.fromARGB(255, 100, 116, 139),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    )
    );
  }
}
