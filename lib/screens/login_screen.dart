import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FC),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A2856),
              ),
              "Welcome Back!",
            ),
            SizedBox(
              height: 4,
            ),
            Text("Continue your learning journey",
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B)
            ),
            ),
            SizedBox(
              height: 24,
            ),
            Text("Email Address",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2856)
            ),
            ),
          ],
        ),
      ),
    );
  }
}
