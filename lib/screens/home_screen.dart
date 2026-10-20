import 'package:flutter/material.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 26),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF64748B),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Muhammed Ranan",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF1A2856),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Friday, 09 October",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              Transform.translate(
                offset: Offset(-10, 45),
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xFF1A2856),
                  size: 40,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color:  Color(0xFF1A2856),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text("Today's Progress",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0, onTap: (index) {}),
    );
  }
}
