import 'package:flutter/material.dart';
import 'package:flutter_dashboard/provider/user_provider.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/widgets/profile/widgets/scheduled.dart';
import 'package:flutter_dashboard/widgets/profile/widgets/weightHeightBloodCard.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
          topLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
        ),
        color: cardBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<UserProvider>(

            builder: (context,s,a) {
              return Column(
                children: [
                  const SizedBox(
                    height:   50,
                  ),
                  CircleAvatar(
                    radius: 30,
                    child: Image.network(
                      s.user!.avatarUrl,
                      loadingBuilder: (c,e,s){
                        return Image.asset('assets/images/avatar.png');
                      },
                      errorBuilder: (c,e,s){
                        return Image.asset('assets/images/avatar.png');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    "${s.user!.firstName} ${s.user!.lastName}",
                    style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    s.user!.email,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.all(Responsive.isMobile(context) ? 15 : 20.0),
                    child: const WeightHeightBloodCard(),
                  ),
                 
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
