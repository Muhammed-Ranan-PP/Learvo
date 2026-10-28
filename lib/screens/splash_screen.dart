import 'package:flutter/material.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      if (!mounted) return;
      final prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

      if (!mounted) return;
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 40, 86),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/Learve_logo.png', width: 80, height: 80),
            SizedBox(height: 8),
            Text(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 36,
              ),
              "Learvo",
            ),
            SizedBox(height: 8),
            Text(
              style: TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 176, 190, 197),
              ),
              "Plan Smart. Learn Better.",
            ),
            SizedBox(height: 250),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 139, 92, 246),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                fixedSize: Size(220, 48),
              ),
              onPressed: () {},
              child: Text(
                "Get Started ->",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
