import 'package:flutter_dashboard/model/permission.dart';

class User {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String avatarUrl;
  late int streamPoints;
  late int Permissionid;
  late List<Permission> permissions=[];

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatarUrl,
      required this.streamPoints,
      required this.permissions});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    avatarUrl = json['avatarUrl'].toString();
    streamPoints = json['streamPoints'];
    Permissionid = json['permission']['id'];
    try {
      var map = [
        "manage_permissions",
        "manage_users",
        "manage_bands",
        "manage_songs",
        "manage_wait_vides",
        "manage_stream_points_reports",
        "manage_stream_bosts",
      ];
      for (var per in map) {
        if (json['permission'][per] ==1) {
          permissions.add(Permission(per));
        }
        
      }
    } catch (e) {
      permissions = [];
    }
  }
  bool hasPermission(String permissionName){
     for (var permission in permissions) {
       if(permission.permissionName == permissionName || permissionName == 'any'){
        return true;
       }
     }
     return false;
  }
}
