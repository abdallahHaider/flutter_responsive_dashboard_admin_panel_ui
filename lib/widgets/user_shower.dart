import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/admins/widgets/comfirm_dialog.dart';
import 'package:flutter_dashboard/provider/user_provider.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class UserShower extends StatelessWidget {
  User user;
  UserShower(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = Provider.of<UserProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: CustomCard(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              child: Image.network(
                
                user.avatarUrl,
               
                loadingBuilder: (c, e, s) {
                  return Image.asset('assets/images/avatar.png');
                },
                errorBuilder: (c, e, s) {
                  return Image.asset('assets/images/avatar.png');
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${user.firstName} ${user.lastName}"),
                SizedBox(
                  height: 5,
                ),
                Text(user.email),
              ],
            ),
            Expanded(child: SizedBox()),
            if(user.id!=currentUser.user!.id)
            ...showConfig(context,user)
            else
            thisIsYou(context)
     
         
          ],
        ),
      ),
    );
  }
}
List<Widget>  showConfig(BuildContext context,User user){
return [
     IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (c)=> ConfirmDialog(user));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                )),
];
}
Widget  thisIsYou(BuildContext context){
  return Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(

          color: Theme.of(context).primaryColor,
borderRadius: BorderRadius.circular(20),
    ),
    child:const Center(child: Text("أنت",style: TextStyle(color: Colors.black),)),
  );
}