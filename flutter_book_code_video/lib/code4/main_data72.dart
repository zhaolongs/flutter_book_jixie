

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
//    return buildBodyFunction3();
    return buildBodyFunction4();
  }


  ///5.3 /lib/code3/main_data72.dart
  /// 弹性布局 Expanded
  Widget buildBodyFunction() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
           Text("标题",),
            Expanded(child: Container(color: Colors.grey,height: 20,),)
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data72.dart
  /// 弹性布局 Expanded
  Widget buildBodyFunction2() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
            Expanded(child: Text("标题",),),
            Expanded(child: Container(color: Colors.grey,height: 20,),)
          ]
          ),));
  }
  ///5.3 /lib/code3/main_data72.dart
  /// 弹性布局 Expanded
  Widget buildBodyFunction3() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
            ///水平方向 上的空间占1份
            Expanded(flex: 1,child: Text("标题",),),
            ///水平方向 上的空间占2份
            Expanded(flex: 2,child: Container(color: Colors.grey,height: 20,),)
          ]
          ),));
  }

  ///5.3 /lib/code3/main_data72.dart
  /// 弹性布局 Expanded
  Widget buildBodyFunction4() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Text文本样式"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
            Text("标题",),
            Flexible(fit: FlexFit.tight,child:Text("人生就有许多这样的奇迹，看似比登天还难的事，有时轻而易举就可以做到，其中的差别就在于非凡的信念"),)
          ]
          ),));
  }
}