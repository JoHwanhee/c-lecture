//https://raw.githubusercontent.com/JoHwanhee/c-lecture/master/www/test11
import 'package:c_lecture/const.dart';
import 'package:c_lecture/model/feeds.dart';
import 'package:c_lecture/model/lectures.dart';
import 'package:c_lecture/util/util.dart';

class FeedService{
  Future<Feeds> getFeeds(String page) async {
    print(page);
    final url = Const.FeedServerUrl + "/api/v1/feeds?page=$page&size=15";
    print(url);
    return Feeds.fromJson(await HttpUtil.httpGetBodyToJson(url));
  }

  Future<Feed> getFeed(String id) async {
    final url = Const.FeedServerUrl + "/api/v1/feeds/$id";
    var res = await HttpUtil.httpGetBodyToJson(url);
    return Feed.fromJson(res['data']);
  }
  Future<String> post(String json) async {
    final url = Const.FeedServerUrl + "/api/v1/feeds";
    return await HttpUtil.httpPost(url, json);
  }

  Future<String> postReply(String id, String json) async {
    final url = Const.FeedServerUrl + "/api/v1/feeds/$id/replies";
    print(url);
    print(json);
    return await HttpUtil.httpPost(url, json);
  }

}