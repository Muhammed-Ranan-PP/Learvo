import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style:  TextStyle(
          color: Color(0xFF8494BC),
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing:  Icon(
        Icons.chevron_right,
        color: Color(0xFF64748B),
      ),
    );
  }
}