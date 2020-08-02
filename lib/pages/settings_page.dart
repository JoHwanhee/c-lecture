import 'dart:io';

import 'package:c_lecture/const.dart';
import 'package:c_lecture/providers/app_provider.dart';
import 'package:c_lecture/services/reg_service.dart';
import 'package:c_lecture/util/consts.dart';
import 'package:c_lecture/util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  final String title;

  SettingPage({Key key, this.title}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}


class _SettingPageState extends State<SettingPage> {
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        title: Container(child: Text("종료 하시겠습니까?")),
        contentPadding: const EdgeInsets.all(0),

        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }

  static final String exit_title = "나가기";

  List items = [
    {
      "icon": Icons.pageview,
      "title": "별명",
      "subtitle" : Const.device.nickname
    }
  ];

  void _showAlert() {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
        width: 260.0,
        height: 230.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      '별명 설정',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            new Expanded(
              child: new Container(
                  child: new TextField(
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      contentPadding: new EdgeInsets.only(
                          left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                      hintText: '원하는 별명을 설정해주세요',
                      hintStyle: new TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                    ),
                  )),
              flex: 2,
            ),

            // dialog bottom
            new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  color: const Color(0xFF33b17c),
                ),
                child: new Text(
                  '설정',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, child: dialog);
  }
  RegService regService = RegService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DeviceUtil.getId(context).then((res){
      regService.getDevice(res).then((devie) {
        setState(() {
          items[0]["subtitle"] = devie.nickname ?? devie.userId;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
    );

    return Scaffold(
      appBar: topAppBar,
      body:  ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              _showAlert();
            },
            title: Text(
              items[index]['title'],
            ),
            subtitle: Text(items[index]['subtitle']),
            trailing: Icon(Icons.edit),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
