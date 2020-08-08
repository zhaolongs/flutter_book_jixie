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

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
//    return buildBodyFunction2();
//    return buildBodyFunction3();
//    return buildBodyFunction4();
  }


  ///5.4 /lib/code3/main_data73.dart
  /// 富文本 的基本使用
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
                          recognizer:TapGestureRecognizer()..onTap=(){
                            print("点击用户协议");
                          }
                        ),
                        TextSpan(
                            text: "与",style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                            text: "《隐私协议》", style: TextStyle(color: Colors.blue),
                            //点击事件
                            recognizer:TapGestureRecognizer()..onTap=(){
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