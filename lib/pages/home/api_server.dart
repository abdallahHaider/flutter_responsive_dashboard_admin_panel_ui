import 'dart:convert';

import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/errors/server_error.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeApi {
  static Future get getDashbordGeneralInformation async {
    var shared = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.parse("${api}admin/dashbord/information"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${shared.getString('token')}'
      },
    );
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return body;
      default:
        throw ServerError("حدثت مشكلة بالاتصال");
    }
  }
    static Future  getStreamChartInformation(String type) async {
    var shared = await SharedPreferences.getInstance();

    var response = await http.get(
      Uri.parse("${api}admin/dashbord/stream_points_charts?type=$type"),
      headers: {
        "content-type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${shared.getString('token')}'
      },
    );
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return body;
      default:
        throw ServerError("حدثت مشكلة بالاتصال");
    }
  }
}
