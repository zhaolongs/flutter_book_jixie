import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/animated_button_statue.dart';

//lib/code7/main_data7019.dart
/// 自定义动画切换按钮
class AnimatedStutesButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
class _PageState extends State {
  ///当前是否是选中状态
  bool isSelect = false;
  ///动画按钮使用到的控制器
  AnimatedStatusController animatedStatusController =
      new AnimatedStatusController();

  //lib/code7/main_data7019.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画样式按钮"),
      ),
      backgroundColor: Colors.white,
      ///
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12),
        ///线性布局上下排开子Widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildAnimatedStatusButton2(),
            SizedBox(height: 44,),
            ///切换样式的动画按钮
            buildAnimatedStatusButton(),
            ///构建控制按钮
            buildControlButton(),
          ],
        ),
      ),
    );
  }
  //lib/code7/main_data7019.dart
  ///构建测试按钮
  Padding buildControlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 60),
      child: RaisedButton(
        child: Text("测试"),
        onPressed: () {
          if (isSelect) {
            ///按钮回到默认的普通样式
            animatedStatusController.close();
          } else {
            ///按钮回到显示小圆圈的样式
            animatedStatusController.select();
          }
          isSelect = !isSelect;
        },
      ),
    );
  }
  //lib/code7/main_data7019.dart
  ///切换样式的动画按钮
  Widget buildAnimatedStatusButton() {
    return AnimatedStatusButton(
      ///控制器
      animatedStatusController: animatedStatusController,
      ///显示按钮的宽度
      width: 220.0,
      ///显示按钮的高度
      height: 40,
      ///动画交互时间
      milliseconds: 1000,
      buttonText: '提交',
      ///背景颜色
      backgroundNormalColor: Colors.white,
      ///边框颜色
      borderNormalColor: Colors.deepOrange,
      ///文字颜色
      textNormalCcolor: Colors.deepOrange,
      ///是否触发点击回调与状态更新
      isUseSelect: false,
      ///点击回调
      clickCallback: () async {
        isSelect = true;
        print("点击事件回调");
        ///模拟耗时操作
        await Future.delayed(Duration(milliseconds: 4000));

        ///返回false 会一直在转圈圈
        ///返回true 会回到默认显示样式
        return Future.value(false);
      },
    );
  }

  //lib/code7/main_data7019.dart
  ///切换样式的动画按钮
  Widget buildAnimatedStatusButton2() {
    return AnimatedStatusButton(

      ///背景颜色
      backgroundNormalColor: Colors.deepOrange,
      ///边框颜色
      borderNormalColor: Colors.deepOrange,
      ///文字颜色
      textNormalCcolor: Colors.white,
      ///按下的高亮颜色
      backgroundHightColor: Colors.grey[300],
      ///选中的边框颜色
      borderSelectColor: Colors.blue,
      ///选中的背景颜色
      backgroundSelectColor: Colors.deepPurple,


      ///控制器
      animatedStatusController: animatedStatusController,
      ///显示按钮的宽度
      width: 220.0,
      ///显示按钮的高度
      height: 40,
      ///动画交互时间
      milliseconds: 10000,
      buttonText: '提交',
      ///响应点击并更新状态
      isUseSelect: true,
      ///点击回调
      clickCallback: () async {
        isSelect = true;
        print("点击事件回调");
        ///模拟耗时操作
        await Future.delayed(Duration(milliseconds: 4000));

        ///返回false 会一直在转圈圈
        ///返回true 会回到默认显示样式
        return Future.value(false);
      },
    );
  }
}
