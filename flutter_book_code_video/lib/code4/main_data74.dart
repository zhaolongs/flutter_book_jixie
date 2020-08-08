import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


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


///5.4 /lib/code3/main_data74.dart
/// 富文本中手势识别的综合使用
class _FirstPageState extends State<FirstPage> {

  TapGestureRecognizer _registProtocolRecognizer;
  TapGestureRecognizer _privacyProtocolRecognizer;
  ///生命周期函数 页面创建时执行一次
  @override
  void initState() {
    super.initState();
    //注册协议的手势
    _registProtocolRecognizer =TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer =TapGestureRecognizer();
  }
  ///生命周期函数 页面销毁时执行一次
  @override
  void dispose() {
    super.dispose();
    ///销毁
    _registProtocolRecognizer.dispose();
    _privacyProtocolRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }

  Widget buildBodyFunction() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Rich Text"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Row(children: [
            // 5.4 /lib/code3/main_data73.dart
            //富文本 点击事件添加
            //  富文本
            RichText(
              ///文字区域
              text:
              TextSpan(
                  text: "登录即代表同意",style: TextStyle(color: Colors.grey),
                  children: [
                        TextSpan(
                          text: "《用户注册协议》", style: TextStyle(color: Colors.blue),
                          //点击事件
                          recognizer:_registProtocolRecognizer..onTap=(){
                            print("点击用户协议");
                          }
                        ),
                        TextSpan(
                            text: "与",style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                            text: "《隐私协议》", style: TextStyle(color: Colors.blue),
                            //点击事件
                            recognizer:_privacyProtocolRecognizer..onTap=(){
                              print("点击隐私协议");
                            }
                        )
                  ]
              ),
            ),

          ]
          ),));
  }
}