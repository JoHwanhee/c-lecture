//https://raw.githubusercontent.com/JoHwanhee/c-lecture/master/www/test11
import 'package:c_lecture/const.dart';
import 'package:c_lecture/model/device.dart';
import 'package:c_lecture/model/feeds.dart';
import 'package:c_lecture/model/lectures.dart';
import 'package:c_lecture/util/util.dart';

class RegService{
  Future<String> postDevice(String json) async {
    print(json);
    final url = Const.FeedServerUrl + "/api/v1/devices";
    return await HttpUtil.httpPost(url, json);
  }
  Future<Device> getDevice(String user_id) async {
    print(user_id);
    final url = Const.FeedServerUrl + "/api/v1/devices/$user_id";
    return Device.fromJson(await HttpUtil.httpGetBodyToJson(url));
  }
}