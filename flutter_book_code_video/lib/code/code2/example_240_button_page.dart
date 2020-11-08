import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example240(),
  ));
}

class Example240 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example240> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      //填充屏幕空间
      body: Column(children: [
        buildProgressButton(),

        buildAnimatedStatusButton(),
      ],),
    );
  }

  ///代码清单 2-87 AnimatedButton 的基本使用
  ///lib/code/code2/example_240_button_page.dart
  Widget buildProgressButton() {
    return //切换样式的动画按钮
      AnimatedButton(
        width: 120.0,
        height: 40,
        buttonText: '动画样式按钮',
        clickCallback: (){
          print("点击事件回调");
        },
      );
  }

  //动画按钮使用到的控制器
  AnimatedStatusController animatedStatusController =
  new AnimatedStatusController();

  //切换样式的动画按钮
  Widget buildAnimatedStatusButton() {
    return AnimatedStatusButton(
      //控制器
      animatedStatusController: animatedStatusController,
      //显示按钮的宽度
      width: 220.0,
      //显示按钮的高度
      height: 40,
      //动画交互时间
      milliseconds: 1000,
      buttonText: '提交',
      //背景颜色
      backgroundNormalColor: Colors.white,
      //边框颜色
      borderNormalColor: Colors.deepOrange,
      //文字颜色
      textNormalCcolor: Colors.deepOrange,
      //点击回调
      clickCallback: () async {
        print("点击事件回调");
        //模拟耗时操作
        await Future.delayed(Duration(milliseconds: 4000));

        //返回false 会一直在转圈圈
        //返回true 会回到默认显示样式
        return Future.value(false);
      },
    );
  }

}
