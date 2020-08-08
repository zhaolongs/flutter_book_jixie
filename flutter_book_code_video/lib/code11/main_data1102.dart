import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1102.dart
/// 复选框的基本使用
class RotundityCheckBoxPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code10/main_data1102.dart
///复选框Checkbox结合TextSpan使用
class _PageState extends State {
  TapGestureRecognizer _privacyProtocolRecognizer;
  TapGestureRecognizer _registProtocolRecognizer;

  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("复选框"),
      ),
      body: Column(
        children: [
          buildCheckboxAndRichText(),
        ],
      ),
    );
  }

  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    super.dispose();

    ///销毁
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
  }

  //lib/code10/main_data1102.dart
  ///复选框的选中标识
  bool checkIsSelect = false;
  ///使用官方素材自定义圆形自选框
  buildCircleCheckBox() {
    return Container(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            checkIsSelect = !checkIsSelect;
          });
        },
        child: checkIsSelect
            ? Icon(
                Icons.check_circle,
                size: 22.0,
                color: Colors.blue,
              )
            : Icon(
                Icons.check_circle,
                size: 22.0,
                color: Colors.grey,
              ),
      ),
    );
  }

  buildCheckboxAndRichText() {
    return Row(
      children: [
        buildCircleCheckBox(),
        SizedBox(
          width: 1,
        ),
        Row(children: [
          // 5.4 /lib/code3/main_data73.dart
          //富文本 点击事件添加
          //  富文本
          RichText(
            ///文字区域
            text: TextSpan(
                text: "登录即代表同意",
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                      text: "《用户注册协议》",
                      style: TextStyle(color: Colors.blue),
                      //点击事件
                      recognizer: _registProtocolRecognizer
                        ..onTap = () {
                          print("点击用户协议");
                        }),
                  TextSpan(
                    text: "与",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextSpan(
                      text: "《隐私协议》",
                      style: TextStyle(color: Colors.blue),
                      //点击事件
                      recognizer: _privacyProtocolRecognizer
                        ..onTap = () {
                          print("点击隐私协议");
                        })
                ]),
          ),
        ]),
      ],
    );
  }

  ///复选框Checkbox的与Text的结合使用
  buildCheckBoxAndText() {
    return Row(
      children: [
        Checkbox(
          ///点击回调
          onChanged: (bool value) {
            setState(() {
              checkIsSelect = value;
            });
          },

          ///padded模式是48px与48px的点击区域
          ///shrinkWrap模式是点击区域要小 为40px与40px的点击区域
          materialTapTargetSize: MaterialTapTargetSize.padded,

          ///为true时 Checkbos是选中状态
          ///为false时 Checkbos是未选中状态
          value: checkIsSelect,
        ),
        Padding(
          padding: EdgeInsets.only(left: 1),
          child: Text("登录代表同意用户协议"),
        )
      ],
    );
  }

  ///复选框Checkbox的基本使用
  buildCheckBox() {
    return Checkbox(
      ///点击回调
      onChanged: (bool value) {
        setState(() {
          checkIsSelect = value;
        });
      },

      ///为true时 Checkbos是选中状态
      ///为false时 Checkbos是未选中状态
      value: checkIsSelect,
    );
  }
}
