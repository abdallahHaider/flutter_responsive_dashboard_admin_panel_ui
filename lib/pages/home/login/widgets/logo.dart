import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/logo.png'),
      decoration: BoxDecoration(),
      width: 75,
      height: 75,
    );
  }
}
