import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/26.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code14/main_data1401.dart
class SwitchBaseUsePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code14/main_data1401.dart
class _TestPageState extends State<SwitchBaseUsePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开关Switch的基本使用"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              buildSwitchWidget(),
              SizedBox(height: 40,),
              buildSwitchWidget2(),
            ],
          )),
    );
  }

 //lib/code14/main_data1401.dart
  ///记录开关的状态
  bool switchValue = false;

  ///开关[Switch]的基本使用
  Widget buildSwitchWidget() {
    return Switch(
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      value: switchValue,
    );
  }

  ///开关[CupertinoSwitch]的基本使用
  ///iOS风格的开关
  Widget buildSwitchWidget2() {
    ///苹果网格的开关
    return CupertinoSwitch(
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      value: switchValue,
    );
  }
}