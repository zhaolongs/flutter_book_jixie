import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/**
 *  文本输入框的基本使用
 */
class TextFieldPassword extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data77.dart
/// 文本输入框 密码
class _PageState extends State<TextFieldPassword> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "文本输入框基本使用"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(),));
  }
  ///6 /lib/code3/main_data77.dart
  /// 文本输入框 密码 隐藏文本
  buildBodyFunction() {
    return new TextField(
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
    );
  }
}