import 'package:flutter/material.dart';
import 'package:learvo/screens/splash_screen.dart';
import 'package:learvo/screens/login_screen.dart';
import 'package:learvo/screens/home_screen.dart';

class AppRoutes {
  static  String splash = '/';
  static  String login = '/login';
  static  String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) =>  SplashScreen(),
    login: (context) =>  LoginScreen(),
    home: (context) =>  HomeScreen(),
  };
}