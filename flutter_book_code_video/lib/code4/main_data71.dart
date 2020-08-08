

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


///5.2 /lib/code3/main_data70.dart
/// 文本显示组件Text
///应用入口 
main() =>
    runApp(
        MaterialApp(
          locale: Locale('zh', 'CN'),
          home: FirstPage(),));


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
//    return buildBodyFunction();
//    return buildBodyFunction2();
//  return buildBodyFunction4();
//  return buildBodyFunction5();
//    return buildBodyFunction6();
//    return buildBodyFunction7();
//    return buildBodyFunction8();
//    return buildBodyFunction9();
    return buildBodyFunction10();
  }


  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐方式 textAlign
  Widget buildBodyFunction() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念",
              ///居中对齐
              textAlign: TextAlign.center,
              style: TextStyle(
                ///文字的颜色
                foreground:Paint()..color=Colors.blue,
                ///文字的大小
                fontSize: 16,
              ),),
          ]
          ),));
  }

  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐方式 textAlign
  Widget buildBodyFunction2() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多",
                textDirection: TextDirection.ltr,
                ///开始位置对齐
                textAlign: TextAlign.start,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 16,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐  文字方向从左向右 开始位置对齐
  Widget buildBodyFunction3() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多",
                textDirection: TextDirection.ltr,
                ///开始位置对齐
                textAlign: TextAlign.start,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 16,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐  文字方向从左向右 结束位置对齐
  Widget buildBodyFunction4() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多",
                textDirection: TextDirection.ltr,
                ///开始位置对齐
                textAlign: TextAlign.end,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 16,
                ),),),
          ]
          ),));
  }

  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐  文字方向从右向左 开始位置对齐
  Widget buildBodyFunction5() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多",
                textDirection: TextDirection.rtl,
                ///开始位置对齐
                textAlign: TextAlign.start,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 16,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  /// 文本对齐  文字方向从右向左 结束位置对齐
  Widget buildBodyFunction6() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多",
                textDirection: TextDirection.rtl,
                ///开始位置对齐
                textAlign: TextAlign.end,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 16,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  /// 文本超出后省略号
  Widget buildBodyFunction7() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念",
// 设置省略号
              overflow: TextOverflow.visible,
// 设置最大显示行数
              maxLines: 1,

                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 18,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  /// 文本超出后省略号
  Widget buildBodyFunction8() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Container(
              ///设置Text的宽度
              width: MediaQuery.of(context).size.width,
              child: Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念",
                ///自动换行
                softWrap:false,
                style: TextStyle(
                  ///文字的颜色
                  foreground: Paint()..color = Colors.blue,
                  ///文字的大小
                  fontSize: 18,
                ),),),
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  ///常用布局
  Widget buildBodyFunction9() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(
            ///内容顶部对齐
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("个性签名：",style: TextStyle(fontWeight: FontWeight.w500),),
            SizedBox(width: 14,),
            ///使用弹性布
            Expanded(child: Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念"),)
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data71.dart
  ///弹性布局解决文本超出限制宽度问题
  Widget buildBodyFunction10() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(
            ///内容顶部对齐
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("个性签名：",style: TextStyle(fontWeight: FontWeight.w500),),
                SizedBox(width: 14,),
                ///使用弹性布局
                Flexible(child: Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念"),)
              ]
          ),));
  }
}