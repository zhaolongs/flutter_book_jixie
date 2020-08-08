import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///5.2 /lib/code3/main_data68.dart
/// 文本显示组件Text
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return buildBodyFunction4();
  }

  ///5.2 /lib/code3/main_data68.dart
  /// 文本显示组件Text
  Widget buildBodyFunction() {

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "这是一个标题"
          ),),
        body: Container(child: Center(
          child: Column(children: [
            Text("inherit: true",
              style: TextStyle(
                ///文字的大小
                  fontSize: 16,
                  ///设置文字的粗细规则为常规体
                  fontWeight: FontWeight.normal
              ),),
    ]

    ),),),);
  }

  Widget buildBodyFunction2() {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "这是一个标题"
        ),),
      body: Container(child: Center(
        child: Column(children: [
          Text("inherit: true",
            style: TextStyle(
              ///文字的大小
                fontSize: 16,
                ///设置文字的粗细规则为常规体
                fontWeight: FontWeight.normal,
              ///设置文字为斜体
              fontStyle: FontStyle.italic
            ),),
        ]

        ),),),);
  }

  Widget buildBodyFunction3() {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "这是一个标题"
        ),),
      body: Container(child: Center(
        child: Column(children: [
          Text("天高水长，小编与你奋斗每一天,Small make up and you struggle every day",),
        ]

        ),),),);
  }

  ///5.7 /lib/code3/main_data68.dart
  /// 文字间距设置
  Widget buildBodyFunction4() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text组件使用分析"),),
      body: Container(child: Center(
        child: Column(children: [

          Text("天高水长，小编与你奋斗每一天,Small make up and you struggle every day",
            style: TextStyle(
              ///字符之间的间隔
              letterSpacing: 12.0,
              ///单词之间的间隔
              wordSpacing: 32.0,
            ),),
        ]
        ),),),);
  }
  ///5.7 /lib/code3/main_data68.dart
  /// 文字间距设置
  Widget buildBodyFunction5() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text组件使用分析"),),
      body: Container(child: Center(
        child: Column(children: [

          Text("天高水长，小编与你奋斗每一天,Small make up and you struggle every day",
            style: TextStyle(
              ///设置文字基线
              textBaseline: TextBaseline.alphabetic
            ),),
        ]
        ),),),);
  }
}