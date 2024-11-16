import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/menu_modal.dart';
import 'package:flutter_dashboard/pages/admins/admin.dart';
import 'package:flutter_dashboard/pages/home/home_page.dart';
import 'package:flutter_dashboard/provider/select_provider.dart';
import 'package:flutter_dashboard/provider/user_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../const.dart';

class Menu extends StatefulWidget {

  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {



  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Consumer<SelectProvider>(
      builder: (context,s,w) {
        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey[800]!,
                  width: 1,
                ),
              ),
              color: const Color(0xFF171821)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: Responsive.isMobile(context) ? 40 : 80,
                ),
                for (var i = 0; i < menu.length; i++)
                if(user!.hasPermission(menu[i].permissionName))
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      color: s.select == i
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          s.changeS(i);
                        });
                        s.key.currentState!.closeDrawer();
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7),
                            child: SvgPicture.asset(
                              
                              menu[i].icon,
                              color: s.select == i ? Colors.black : Colors.grey,width: 25,height: 25,
                            ),
                          ),
                          Text(
                            menu[i].title,
                            style: TextStyle(
                                fontSize: 16,
                                color: s.select == i ? Colors.black : Colors.grey,
                                fontWeight: s.select == i
                                    ? FontWeight.w600
                                    : FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            )),
          ),
        );
      }
    );
  }
}
