import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/animated_button.dart';

//lib/code7/main_data7018.dart
/// 自定义动画切换按钮
class AnimatedButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("动画样式按钮"),),
        backgroundColor: Colors.white,
        ///填充布局
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              ///切换样式的动画按钮
              AnimatedButton(
                width: 120.0,
                height: 40,
                buttonText: '动画样式按钮',
                clickCallback: (){
                  print("点击事件回调");
                },
              ),
            ],
          ),
        ),
    );
  }
}
