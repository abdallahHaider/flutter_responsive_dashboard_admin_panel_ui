import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/health_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';

class ActivityDetailsCard extends StatelessWidget {
  var data;
   ActivityDetailsCard({super.key,required this.data});

 

  @override
  Widget build(BuildContext context) {
     List<HealthModel> healthDetails =  [
    HealthModel(
        icon: 'assets/svg/users.svg', value: data['users'].toString(), title: "المستخدمين",color: Colors.red),
    HealthModel(icon: 'assets/svg/burn.svg', value: data['stream_points'].toString(), title: "نقاط الستريم",color: Colors.orange),
    HealthModel(
        icon: 'assets/svg/videos.svg', value:  data['wait_videos'].toString(), title: "فيديوهات الانتظار",color: Colors.purple),
    HealthModel(icon: 'assets/svg/card.svg', value:  data['video_bosts'].toString(), title: "بطاقات الستريم",color: Colors.blue),
  ];
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(healthDetails[i].icon,color: healthDetails[i].color,width: 32,height: 32,),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                textAlign :TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}
