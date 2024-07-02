import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onPressed;

  LoginButton(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          height: 50,
          child: const Center(
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}