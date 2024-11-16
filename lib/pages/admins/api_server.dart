import 'dart:convert';

import 'package:flutter_dashboard/errors/server_error.dart';
import 'package:flutter_dashboard/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../const.dart';

class AdminAPi {
  static Future<List<User>> get getAllUsers async {
    var shared = await SharedPreferences.getInstance();
    var response = await http.get(
      Uri.parse("${api}admin/index"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${shared.getString('token')}'
      },
    );
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        List<User> user = [];
        for (var i in body['data']) {
          user.add(User.fromJson(i));
        }
        return user;
      default:
        throw ServerError("لا يمكن جلب المستخدمين");
    }
  }
  static Future<void> deletePermission(int id)async{
     var shared = await SharedPreferences.getInstance();
    var response = await http.delete(
      Uri.parse("${api}admin/permission/delete?id=$id"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${shared.getString('token')}'
      },
    );
    switch(response.statusCode){
      case 200:
      break;
      default:
      
      throw ServerError("حدثت مشكلة بالاتصال");
    }
  }
}
