import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/api_server.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/dashboard.dart';
import 'package:flutter_dashboard/model/user_model.dart';
import 'package:flutter_dashboard/pages/login/login.dart';
import 'package:flutter_dashboard/provider/user_provider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget startScreen = LoginPage();
void main() async {
  var pp = UserProvider();
  WidgetsFlutterBinding.ensureInitialized();
  var shared = await SharedPreferences.getInstance();
  if (shared.getString('token') !=null) {
    try {
      
      User user = await MainApi.viewAccount(shared.getString('token')!);
      pp.setUser(user);
      if (user.permission != null) {
        startScreen = DashBoard();
      }
    } catch (e) {
    }
  }
  runApp( MyApp(provider: pp,));
}

class MyApp extends StatelessWidget {
  UserProvider provider;
   MyApp({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
 
    return ChangeNotifierProvider(
      create: (c)=>provider,
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        title: 'Flutter Responsive Dashboard',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            primaryColor: MaterialColor(
              primaryColorCode,
              <int, Color>{
                50: const Color(primaryColorCode).withOpacity(0.1),
                100: const Color(primaryColorCode).withOpacity(0.2),
                200: const Color(primaryColorCode).withOpacity(0.3),
                300: const Color(primaryColorCode).withOpacity(0.4),
                400: const Color(primaryColorCode).withOpacity(0.5),
                500: const Color(primaryColorCode).withOpacity(0.6),
                600: const Color(primaryColorCode).withOpacity(0.7),
                700: const Color(primaryColorCode).withOpacity(0.8),
                800: const Color(primaryColorCode).withOpacity(0.9),
                900: const Color(primaryColorCode).withOpacity(1.0),
              },
            ),
            scaffoldBackgroundColor: Color(0xFF171821),
            fontFamily: 'IBMPlexSans',
            brightness: Brightness.dark),
        home:startScreen,
      ),
    );
  }
}
