import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/permission.dart';

class MenuModel {
  String icon;
  String title;
  Widget screen;
  String permissionName;
  MenuModel({required this.icon, required this.title,required this.screen,required this.permissionName}){}
}
