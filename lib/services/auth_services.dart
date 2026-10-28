import 'package:hive_flutter/hive_flutter.dart';
import 'package:learvo/models/user_model.dart';

class AuthServices {
  final Box<User> userBox = Hive.box<User>('users');

  Future<bool>signUp(String name,String email,String password)async{
    for (var user in userBox.values){
      if(user.email == email){
        return false;
      }
    }
    User newUser = User(
      name: name,
       email: email,
        password: password
        );
        await userBox.add(newUser);
        return true;
  }
  User? login(String email,String password){
    for(var user in userBox.values){
      if(user.email == email && user.password == password){
        return user;
      }
    }
    return null;
  }
}