import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/pages/home/home_page.dart';
import 'package:flutter_dashboard/provider/select_provider.dart';
import 'package:flutter_dashboard/provider/user_provider.dart';
import 'package:flutter_dashboard/widgets/menu.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/widgets/profile/profile.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
//Homepage
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (e)=>SelectProvider(_scaffoldKey),
      child: Scaffold(
          key: _scaffoldKey,
          drawer:!Responsive.isDesktop(context) ? const SizedBox(width: 250,
          child: Menu()) :null,
          endDrawer:Responsive.isMobile(context) ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Profile()) : null,
          body: SafeArea(
            child: Row(
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Menu()),
                  ),
                Consumer<SelectProvider>(
                  builder: (context,s,w) {
                    return Expanded(flex: 8, child: menu[s.select].screen);
                  }
                ),
                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 4,
                    child: Profile(),
                  ),
              ],
            ),
          )),
    );
  }
}
