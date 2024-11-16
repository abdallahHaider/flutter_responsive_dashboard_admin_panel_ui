import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/home/api_server.dart';
import 'package:flutter_dashboard/pages/home/widgets/activity_details.card_loading.dart';
import 'package:flutter_dashboard/pages/home/widgets/header_widget.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/pages/home/widgets/activity_details_card.dart';
import 'package:flutter_dashboard/pages/home/widgets/line_chart_card.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 15 : 18),
          child: Column(
            children: [
              
              SizedBox(
                height: Responsive.isMobile(context) ? 5 : 18,
              ),
              
              Header(text: "المعلومات العامة"),
              
              _height(context),
              __getGeneralInformation,
              _height(context),
              
              LineChartCard(),
              _height(context),
             
            ],
          ),
        )));
  }
}

Widget get __getGeneralInformation {
  return FutureBuilder(
    future: HomeApi.getDashbordGeneralInformation,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const ActivityDetailsCardLoading();
      } else if (snapshot.hasData) {
        return ActivityDetailsCard(data: snapshot.data);
      } else {
        return const CustomCard(
          width: double.infinity,
          height: 100,
          child: Center(child: Text('حدثت مشكلة بجلب المعلومات العامة')),
        );
      }
    },
  );
}

