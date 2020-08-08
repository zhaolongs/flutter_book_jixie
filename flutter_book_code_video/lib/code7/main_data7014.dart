import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

//lib/code7/main_data7014.dart
///带有加载进度的按钮
class ProgressButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<ProgressButtonPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      ///填充屏幕空间
      body: ConstrainedBox(constraints: BoxConstraints.expand(), child: Column(
        children: [
          SizedBox(height: 40,),
              ProgressButton(
                ///默认显示的内容
                defaultWidget: Text(
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
                ///加载中的显示内容
                progressWidget: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
                width: 196,
                height: 40,
                ///按钮的点击事件
                onPressed: () async {
                  ///这里用来执行异步的耗时操作
                  ///例如这里模拟的3000毫秒
                  int score = await Future.delayed(
                      const Duration(milliseconds: 3000), () => 42);
                  ///结束动画
                  return () {};
                },
              ),
              SizedBox(height: 40,),
          ProgressButton(
            ///默认显示的内容
            defaultWidget:  Text('登录' ,style: TextStyle(color: Colors.white),),
            ///加载中的显示内容
            progressWidget:  CircularProgressIndicator(backgroundColor: Colors.white,),
            width: 196,
            height: 50,
            ///按钮的点击事件
            onPressed: () async {
              int score = await Future.delayed(
                  const Duration(milliseconds: 3000), () => 42);
              // After [onPressed], it will trigger animation running backwards, from end to beginning
              return () {

              };
            },
          ),
        ],
      )),
    );
  }
}
