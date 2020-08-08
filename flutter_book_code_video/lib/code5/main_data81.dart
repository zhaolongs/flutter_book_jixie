import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';


/**
 *  限制输入框内输入文本的行数与字数
 */
class TextFieldMaxLengthPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data81.dart
/// 字数输入限制
class _PageState extends State {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "字数输入限制"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction2(),));
  }

  ///6 /lib/code3/main_data81.dart
  /// 字数输入限制
  /// 实现方式一
  buildBodyFunction() {
    return new TextField(
      ///输入的字数最多为 4字
      maxLength: 4,
      ///当设置为true时，会忽略多余的输入内容，默认为true
      ///当设置为false时，输入超出的内容部分还会显示进入文本输入框
      maxLengthEnforced: false,);
  }

  ///6 /lib/code3/main_data81.dart
  /// 字数输入限制
  /// 实现方式二
  buildBodyFunction2() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: <TextInputFormatter>[
        ///当长度大于4的时候就不允许再输入了
        LengthLimitingTextInputFormatter(4)
      ],);
  }
}