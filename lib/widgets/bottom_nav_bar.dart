import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.home_outlined, "Home"),
      (Icons.calendar_month_outlined, "Schedule"),
      (Icons.show_chart, "Progress"),
      (Icons.person_outline, "Profile"),
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 226, 232, 240)),
        ),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index].$1,
                    color: isSelected
                        ? Color.fromARGB(255, 139, 92, 246)
                        : Color.fromARGB(255, 100, 116, 139),
                  ),
                  SizedBox(height: 4),
                  Text(
                    items[index].$2,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Color.fromARGB(255, 139, 92, 246)
                          : Color.fromARGB(255, 100, 116, 139),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
