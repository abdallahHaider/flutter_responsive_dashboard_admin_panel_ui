import 'package:flutter/material.dart';

class SelectProvider extends ChangeNotifier{
  GlobalKey<ScaffoldState> key;
  SelectProvider(this.key);
  int select = 0;
  void changeS(int s){
    select = s;
    notifyListeners();
  }
}