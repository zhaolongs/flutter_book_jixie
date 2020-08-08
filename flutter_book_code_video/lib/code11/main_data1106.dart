import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1106.dart
/// 复选框的基本使用
class CheckboxListTilePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code10/main_data1106.dart
///复选框Checkbox结合TextSpan使用
class _PageState extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("复选框"),
      ),
      body: Column(
        children: [
          SizedBox(height: 66,),
          buildCheckBox(),
        ],
      ),
    );
  }
 //lib/code10/main_data1106.dart
  bool checkIsSelect = false;
  ///复选框Checkbox的基本使用
  buildCheckBox() {
    return CheckboxListTile(
      // 当前对应的复选框是否选中
      value: checkIsSelect,
      //是否选中发生变化时的回调， 回调的 bool 值 就是是否选中 , true 是 选中
      onChanged: (value) {
        setState(() {
          checkIsSelect = value;
        });
      },
      // 选中时 checkbox 的填充的颜色 ，
      activeColor: Colors.red,
      // 标题， selected 如果是 true
      // 如果 不设置 text 的 color 的话，
      // text的颜色使用activeColor
      title: Text("标题",),
      // 副标题（在 title 下面）
      subtitle: Text("副标题"),
      //是否是三行文本
      //如果是 true 副标题 不能为 null
      //如果是 false 如果没有副标题
      // 就只有一行， 如果有副标题 ，就只有两行
      isThreeLine: true,
      // 是否密集垂直
      dense: false,
      // 左边的控件
      secondary:  Image.asset(
        "assets/images/2.0x/logo.jpg",
        fit: BoxFit.fill,
      ),
      // text 和 icon 的 color 是否 是 activeColor 的颜色
      selected: false,
      ///方向模型
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
