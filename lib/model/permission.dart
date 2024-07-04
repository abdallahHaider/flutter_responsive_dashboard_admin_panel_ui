
class Permission {
  int? id;
  int? userId;
  int? managePermissions;
  int? manageUsers;
  int? manageBands;
  int? manageSongs;
  int? manageWaitVides;
  int? manageStreamPointsReports;
  int? manageStreamBosts;


  Permission(
      {this.id,
      this.userId,
      this.managePermissions,
      this.manageUsers,
      this.manageBands,
      this.manageSongs,
      this.manageWaitVides,
      this.manageStreamPointsReports,
      this.manageStreamBosts,
 });

  Permission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    managePermissions = json['manage_permissions'];
    manageUsers = json['manage_users'];
    manageBands = json['manage_bands'];
    manageSongs = json['manage_songs'];
    manageWaitVides = json['manage_wait_vides'];
    manageStreamPointsReports = json['manage_stream_points_reports'];
    manageStreamBosts = json['manage_stream_bosts'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['manage_permissions'] = this.managePermissions;
    data['manage_users'] = this.manageUsers;
    data['manage_bands'] = this.manageBands;
    data['manage_songs'] = this.manageSongs;
    data['manage_wait_vides'] = this.manageWaitVides;
    data['manage_stream_points_reports'] = this.manageStreamPointsReports;
    data['manage_stream_bosts'] = this.manageStreamBosts;

    return data;
  }
}