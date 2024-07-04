import 'package:flutter/material.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class WeightHeightBloodCard extends StatelessWidget {
  const WeightHeightBloodCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      color:  Color(0xFF2F353E),
      child: Text("جميع العمليات التي تقوم بها تسجل في قاعدة البيانات مما يتيح للادمن المسؤول الاطلاع عليها",textAlign: TextAlign.center,)
    );
  }

  Widget details(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
