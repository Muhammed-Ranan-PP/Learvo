import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/user_model.dart';

class HomeServices {
  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("userEmail");
    if (email != null) {
      final userBox = Hive.box<User>("users");
      for (var user in userBox.values) {
        if (user.email == email) {
          return user.name;
        }
      }
    }
    return null;
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  String getFormattedDate() {
    DateTime currentDate = DateTime.now();

    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return "${weekdays[currentDate.weekday - 1]}, ${currentDate.day} ${months[currentDate.month - 1]}";
  }
}
