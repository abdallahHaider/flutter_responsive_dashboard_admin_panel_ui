import 'package:flutter/material.dart';
import 'package:flutter_dashboard/widgets/text_field.dart';

class AdminHeader extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  AdminHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      child: Row(
        children: [
          Flexible(
            child: CustomTextField(
                icon: Icons.search,
                hint: "البحث بواسطة الايميل",
                controller: controller),
          ),
          SizedBox(width: 5,),
          _search(context)
        ],
      ),
    );
  }
}

Widget _search(BuildContext context) {
  return InkWell(
    onTap: (){
      print('خليك وياي وياي');
    },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 65,
        height: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'بحث',
              style: TextStyle(color: Colors.black),
            ),
          )));
}
