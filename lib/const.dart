
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/menu_modal.dart';
import 'package:flutter_dashboard/pages/admins/admin.dart';
import 'package:flutter_dashboard/pages/home/home_page.dart';

const primaryColorCode = 0xFFA9DFD8;
const cardBackgroundColor = Color(0xFF21222D);
const api ="http://127.0.0.1:8000/api/";
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "المعلومات العامة",screen: HomePage(),permissionName: 'any'),
    // MenuModel(icon: 'assets/svg/user.svg', title: "حسابات المستخدمين"),
    MenuModel(icon: 'assets/svg/admin.svg', title: "الادمنز",screen: AdminPage(),permissionName: 'manage_permissions'),
    // MenuModel(icon: 'assets/svg/team.svg', title: "الفرق"),
    // MenuModel(icon: 'assets/svg/song.svg', title: "اغاني الستريم"),
    // MenuModel(icon: 'assets/svg/videos.svg', title: "فيديوهات الانتظار"),
    // MenuModel(icon: 'assets/svg/card.svg', title: "البطاقات"),
    // MenuModel(icon: 'assets/svg/signout.svg', title: "تسجيل الخروج"),
  ];