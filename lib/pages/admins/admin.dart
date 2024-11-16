import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/admins/api_server.dart';
import 'package:flutter_dashboard/pages/admins/widgets/admin_header.dart';
import 'package:flutter_dashboard/pages/home/widgets/header_widget.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_dashboard/widgets/user_shower.dart';
import 'package:flutter_dashboard/widgets/user_shower_loading.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(
              text: 'الادمنز',
            ),
            AdminHeader(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder(
                future: AdminAPi.getAllUsers,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.builder(
                      itemBuilder: (c, i) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: UserShowerLoading(),
                      ),
                      itemCount: 10,
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: UserShower(snapshot.data![i]),
                          );
                        });
                  } else {
                    return const CustomCard(
                      width: double.infinity,
                      height: 100,
                      child: Center(child: Text('حدثت مشكلة بجلب الادمنز ')),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
