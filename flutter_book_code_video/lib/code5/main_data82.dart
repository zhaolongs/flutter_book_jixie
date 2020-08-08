import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/**
 *  限制输入框内输入文本的行数与字数
 */
class TextFieldMaxLinePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data82.dart
/// 行数输入限制
class _PageState extends State {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "行数输入限制",
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction2(),));
  }

  ///6 /lib/code3/main_data82.dart
  /// 行数输入限制
  buildBodyFunction() {
    return new TextField(
      ///最大行数为4行
      maxLines: 4,
      ///最小行数为1行
      minLines: 1,
      ///输入的字数最多为20字
      maxLength: 20,
      ///当设置为true时，会忽略多余的输入内容，默认为true
      ///当设置为false时，输入超出的内容部分还会显示进入文本输入框
      maxLengthEnforced: false,);
  }
  ///6 /lib/code3/main_data82.dart
  /// 文本输入框填充高度
  buildBodyFunction2() {
    return new TextField(
      ///最大行数与最小行数
      minLines: null,
      maxLines:null ,
      ///填充父布局
      expands: true,
     );
  }
}