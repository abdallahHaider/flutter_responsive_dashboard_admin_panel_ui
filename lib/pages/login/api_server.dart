import 'dart:convert';

import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/errors/server_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<User> login(
    String email,
    String password,
  ) async {
    var response = await http.post(Uri.parse("${api}admin/login"),
        headers: {"content-type": "application/json"},
        body: jsonEncode({'email': email, 'password': password}));
        var body=jsonDecode(response.body);
  switch(response.statusCode){
    case 200:
      var shared = await SharedPreferences.getInstance();
    await shared.setString('token', body['api_token']);
    return User.fromJson(body['user']);
    case 403:
    throw ServerError(body['message']);
    default:
    throw ServerError("حدث خطا غير متوقع");
  }
  }
}
