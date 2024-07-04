import 'package:flutter_dashboard/model/permission.dart';

class User {
 late int id;
 late String  firstName;
 late String lastName;
 late String email;
 late String avatarUrl;
 late int streamPoints;
 late Permission? permission;

  User(
      {required this.id,required
      this.firstName,required
      this.lastName,required
      this.email,required
      this.avatarUrl,required
      this.streamPoints,required
      this.permission});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    avatarUrl = json['avatarUrl'].toString();
    streamPoints = json['streamPoints'];
    try{
    permission =  Permission.fromJson(json['permission']);
    }catch(e){
      permission = null;
    }
  }

}

