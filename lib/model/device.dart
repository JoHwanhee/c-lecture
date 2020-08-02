class Device {
  String id;
  String userId;
  String deviceId;
  String nickname;

  Device({this.id, this.userId, this.deviceId, this.nickname});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['device_id'] = this.deviceId;
    data['nickname'] = this.nickname;
    return data;
  }
}