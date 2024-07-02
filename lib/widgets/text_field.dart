import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/responsive.dart';

class CustomTextField extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  String hint;
  bool isPassword;
  CustomTextField(
      {super.key,
      required this.icon,
      required this.hint,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
          fillColor: cardBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: hint,
          isCollapsed: true,
        prefixIcon: Icon(icon)),
    );
  }
}
