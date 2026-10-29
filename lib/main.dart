import 'package:flutter/material.dart';
import 'package:learvo/models/user_model.dart';
import 'package:learvo/routes/app_routes.dart';
import 'package:learvo/theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/task_model.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<User>('users');
  await Hive.openBox<Task>('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
