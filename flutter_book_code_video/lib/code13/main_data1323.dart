import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */


//lib/code/main_data1323.dart
//为局部文本添加点击事件
class InkWellUsePage7 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<InkWellUsePage7> {

  TapGestureRecognizer _privacyProtocolRecognizer;
  TapGestureRecognizer _registProtocolRecognizer;
  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer =TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer =TapGestureRecognizer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击事件"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 12, right: 12),
        child: Row(children: [
          //  富文本
          buildRichText(),
        ]),
      ),
    );
  }

  ///富文本代码块
  RichText buildRichText() {
    return RichText(
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
        );
  }
}
