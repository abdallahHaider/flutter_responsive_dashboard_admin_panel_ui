import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/user_model.dart';

class UserProvider extends ChangeNotifier{
  User? user ;
  void setUser(User user){
    this.user = user;
    notifyListeners();
  }

  
}