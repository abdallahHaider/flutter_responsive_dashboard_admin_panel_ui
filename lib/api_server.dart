import 'dart:convert';

import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/errors/server_error.dart';
import 'package:flutter_dashboard/model/user_model.dart';
import 'package:http/http.dart' as http;

class MainApi {
  static Future<User> viewAccount(String token) async {
    var response = await http.get(
      Uri.parse("${api}user/show"),
      headers: {
        "content-type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:

      
        return User.fromJson(body['data']);
      case 401:
        throw ServerError("حدثت مشكلة بتسجيل الدخول");
      default:
        throw ServerError("حدث خطا غير متوقع");
    }
  }
}
