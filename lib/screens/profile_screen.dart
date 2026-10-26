import 'package:flutter/material.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/profile_menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Color(0xFF21124F),
          child: Column(
            children: [
              SizedBox(height: 24),
              CircleAvatar(
                radius: 58,
                backgroundColor: Color(0xFFE2ECFF),
                child: Icon(Icons.person, size: 80, color: Color(0xFF8B5CF6)),
              ),
              SizedBox(height: 8),
              Text(
                "Muhammed Ranan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text("Learner", style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children:  [
                      SizedBox(height: 12),
                      ProfileMenuItem(
                        title: "My Details",
                        icon: Icons.person_outline,
                        iconColor: Color(0xFF1A2856),
                      ),
                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "App Settings",
                        icon: Icons.settings_outlined,
                        iconColor: Color(0xFF1A2856),
                      ),

                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "Help & Support",
                        icon: Icons.help_outline,
                        iconColor: Color(0xFF1A2856),
                      ),
                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "Log Out",
                        icon: Icons.logout,
                        iconColor: Color(0xFFFF1744),
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route)=>false);
                        },
                      ),
                      Spacer(),
                      Icon(
                        Icons.menu_book_rounded,
                        color: Color(0xFF2878FF),
                        size: 38,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Better Learning \n Brighter Future",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF8494BC),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.schedule);
          } else if (index == 2) {
            Navigator.pushNamed(context, AppRoutes.progress);
          }
        },
      ),
    );
  }
}
