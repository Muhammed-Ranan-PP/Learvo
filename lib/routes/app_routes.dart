import 'package:flutter/material.dart';
import 'package:learvo/screens/splash_screen.dart';
import 'package:learvo/screens/login_screen.dart';
import 'package:learvo/screens/home_screen.dart';
import 'package:learvo/screens/schedule_screen.dart';
import 'package:learvo/screens/progress_screen.dart';
import 'package:learvo/screens/profile_screen.dart';
import 'package:learvo/screens/notes_screen.dart';
import 'package:learvo/screens/add_task_screen.dart';
import 'package:learvo/screens/signup_screens.dart';

class AppRoutes {
  static String splash = "/";
  static String login = "/login";
  static String home = "/home";
  static String schedule = "/schedule";
  static String progress = "/progress";
  static String profile = "/profile";
  static String notes = "/notes";
  static String addTask = "/addTask";
  static String signUp = "/signUp";
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => SplashScreen(),
    login: (context) => LoginScreen(),
    home: (context) => HomeScreen(),
    schedule: (context) => ScheduleScreen(),
    progress: (context) => ProgressScreen(),
    profile: (context) => ProfileScreen(),
    notes: (context) => NotesScreen(),
    addTask: (context) => AddTaskScreen(),
    signUp: (context) => SignupScreens(),
  };
}
