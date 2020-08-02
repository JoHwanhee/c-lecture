import 'dart:io';

import 'package:c_lecture/model/device.dart';

class Const {
    static const String LectureServerUrl = "https://raw.githubusercontent.com/JoHwanhee/c-lecture/master/www";
    static const String LectureCLangServerUrl = "https://raw.githubusercontent.com/JoHwanhee/c-lecture/master/www/c";
    static const String ImageServerDirectory = "https://raw.githubusercontent.com/JoHwanhee/c-lecture/master/www/c/";
    static const String IndexJsonPath = "/index.json";
    static const String TitleImagePath = "/title.jpg";

    static const String FeedServerUrl = "https://api.c-lecture.ga:49497";

    static int AdCount = 0;
    static int NativeAdCount = 0;

    static Device device;
}