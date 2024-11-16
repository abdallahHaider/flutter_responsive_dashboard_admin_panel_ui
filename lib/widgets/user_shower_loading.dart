import 'package:flutter/material.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

import '../model/user_model.dart';

class UserShowerLoading extends StatelessWidget {
   UserShowerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: CustomCard(
    
        width: double.infinity,
        height: 100,
      
            child: Row(
          children: [
               const CircleAvatar(
                    radius: 30,
                    backgroundColor:Colors.grey ,
                  ),
                  SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textContainter(context, 100),
                SizedBox(height: 5,),
                _textContainter(context, 150)
              ],
            )
          ],
        ),
      ),
    );
  }
}
Widget  _textContainter(context,width){
  return CustomCard(
    height: 20,
    color:Colors.grey,
    width: width,
    child: SizedBox(),
  );
}