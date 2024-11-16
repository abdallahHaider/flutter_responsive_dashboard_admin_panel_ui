import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/provider/select_provider.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  String text;

   Header({
    super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    var key= Provider.of<SelectProvider>(context).key;
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () => key.currentState!.openDrawer(),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.grey,
                    size: 25,
                  ),
                ),
              ),
            ),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 4,
              child: Text(text)
            ),
          if (Responsive.isMobile(context))
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                InkWell(
                  onTap: () => key.currentState!.openEndDrawer(),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      "assets/images/avatar.png",
                      width: 32,
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
