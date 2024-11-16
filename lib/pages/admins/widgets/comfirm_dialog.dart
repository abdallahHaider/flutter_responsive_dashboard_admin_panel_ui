import 'package:flutter/material.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/pages/admins/api_server.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../model/user_model.dart';

class ConfirmDialog extends StatelessWidget {
  User user;
  ConfirmDialog(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: CustomCard(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        const  SizedBox(
            height: 10,
          ),
          const Text(
            "ازالة الحساب من الادمنز",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'هل انت متأكد من انك تريد ازالة الحساب من الادمنز؟',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _customButton("نعم", Colors.red, () async {
                try {

                  SmartDialog.showLoading();
                  await AdminAPi.deletePermission(user.Permissionid);
                  Navigator.of(context).pop();
                  SmartDialog.showToast("تم حذف الادمن بنجاح");
                  
                } catch (e) {
                  Navigator.of(context).pop();
                  SmartDialog.showNotify(
                      msg: "حدثت مشكلة بالاتصال", notifyType: NotifyType.error);
                }
              }),
              const SizedBox(
                width: 10,
              ),
              _customButton("لا", Colors.black.withOpacity(0.3), () {
                Navigator.of(context).pop();
              }),
            ],
          )
        ],
      )),
    );
  }
}

Widget _customButton(String text, Color color, Function function) {
  return InkWell(
    onTap: () {
      function();
    },
    borderRadius: BorderRadius.circular(10),
    child: Container(
      width: 50,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(child: Text(text)),
    ),
  );
}
