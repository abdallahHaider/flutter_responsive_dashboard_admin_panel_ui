import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;


  const CustomCard({super.key, this.color,this.padding, required this.child,this.width,this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          color: color ?? cardBackgroundColor,
        ),
        child: Padding(
          padding:padding?? const EdgeInsets.all(12.0),
          child: child,
        ));
  }
}
