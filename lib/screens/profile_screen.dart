import 'package:flutter/material.dart';
import 'package:learvo/widgets/bottom_nav_bar.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/widgets/profile_menu_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learvo/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
  
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  Future<void>getUserdetails()async{
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString("userEmail")?? "";
    var userBox = Hive.box<User>("users");
    for(var user in userBox.values){
      if(user.email == email){
      setState(() {
        name = user.name;
        email = user.email;
      });
      }
    }
  }
  @override
  void initState(){
    super.initState();
    getUserdetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 26, 40, 86),
          child: Column(
            children: [
              SizedBox(height: 24),
              CircleAvatar(
                radius: 58,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Color.fromARGB(255, 139, 92, 246),
                ),
              ),
              SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(email, style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      ProfileMenuItem(
                        title: "My Details",
                        icon: Icons.person_outline,
                        iconColor: Color.fromARGB(255, 26, 40, 86),
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.myDetails);
                        },
                      ),
                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "App Settings",
                        icon: Icons.settings_outlined,
                        iconColor: Color.fromARGB(255, 26, 40, 86),
                      ),
                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "Help & Support",
                        icon: Icons.help_outline,
                        iconColor: Color.fromARGB(255, 26, 40, 86),
                      ),
                      Divider(height: 1, indent: 30, endIndent: 30),
                      ProfileMenuItem(
                        title: "Log Out",
                        icon: Icons.logout,
                        iconColor: Color.fromARGB(255, 255, 23, 68),
                        onTap: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool("isLoggedIn", false);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.login,
                            (route) => false,
                          );
                        },
                      ),
                      Spacer(),
                      Icon(
                        Icons.menu_book_rounded,
                        color: Color.fromARGB(255, 40, 120, 255),
                        size: 38,
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Better Learning \n Brighter Future",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 132, 148, 188),
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
