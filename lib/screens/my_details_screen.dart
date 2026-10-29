import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:learvo/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/widgets/detail_card.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({super.key});

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  String name = "";
  String email = "";
  String password = "";
  Future<void>getUserdetails()async{
    final prefs =await SharedPreferences.getInstance();
    String savedEmail = prefs.getString("userEmail")??"";
    var userBox = Hive.box<User>("users");
    for(var user in userBox.values){
      if(user.email == savedEmail){
        setState(() {
          name = user.name;
          email = user.email;
          password = user.password;
        });
        break;
      }
    }
  }
  @override
  void initState() {
    super.initState();
    getUserdetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:  Text(
          "My Details",
          style: TextStyle(
            color: Color(0xFF1A2856),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme:  IconThemeData(color: Color(0xFF1A2856)),
        centerTitle: true,
      ),
      body:  SafeArea(child: Column(children: [
        SizedBox(height: 30),
        CircleAvatar(
           radius: 45,
        backgroundColor: Color(0xFFEEE9FF),
        child: Icon(
          Icons.person,
          size: 55,
          color: Color(0xFF8B5CF6),
        )
        ),
        SizedBox(height: 30),
        DetailCard(title: "Full Name", value: name),
        SizedBox(
          height: 16,
        ),
        DetailCard(title: "Email Address", value: email),
        SizedBox(
          height: 16,
        ),
        DetailCard(title: "Password", value: "*********")
      ])),
    );
  }
}
