import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF101828),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 36,
              ),
              "Learvo",
            ),
            SizedBox(
              height: 8,
            ),
            Text(style: TextStyle(fontSize: 14,color: Color(0xFFB0BEC5)),"Plan Smart. Learn Better.")
          ],
        ),
      ),
    );
  }
}
