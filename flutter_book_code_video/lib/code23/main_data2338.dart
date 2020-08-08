import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/page/catalogue/read_book_page.dart';
import 'package:flutterbookcode/utils/log_util.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2338.dart

class ReadBookPage1 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<ReadBookPage1>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    for (var i = 0; i < list.length; i++) {
      widgetList.add(buildCurrentWidget(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
        width: double.infinity,
        child: ReadBookPage(
          list: widgetList,
          loopDuration: Duration(milliseconds: 2000),
          onChangeCallBack: (value) {
            LogUtil.e("回调 $value");
          },
        ),
      ),
    );
  }

  List<String> list = [
    "assets/images/2.0x/banner2.webp",
    "assets/images/2.0x/banner3.webp",
    "assets/images/2.0x/banner4.webp",
    "assets/images/2.0x/banner5.webp",
  ];

  List<Widget> widgetList = [];

  buildCurrentWidget(int index) {
    return Stack(
      children: [
        Image.asset(
          list[index],
          fit: BoxFit.fill,
          width: 200,
        ),
        Positioned(
          bottom: 8,right: 8,
          child: Container(
            width: 24,
            alignment: Alignment.center,
            height: 24,
            decoration: BoxDecoration(
                color: Colors.indigoAccent[100],
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Text("$index"),
          ),
        )
      ],
    );
  }
}
