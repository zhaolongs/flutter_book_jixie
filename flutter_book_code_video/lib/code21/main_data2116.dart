import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2116.dart
///   点击波浪效果
class WaterWavesPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with SingleTickerProviderStateMixin {

  ///点按水波浪 记录手指点击的位置
  Offset downSwiperOffset=Offset.zero;
  ///水波浪变化的半径
  double ratioValue=0;
  ///动画控制器
  ///这里的控制器充当一个定时器的作用
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    ///初始化动画控制器
    controller = new AnimationController(
        duration: new Duration(milliseconds: 600), vsync: this);
    ///添加监听
    controller.addListener(() {
      setState(() {
          ratioValue =controller.value;
      });
    });
    ///添加状态监听
    controller.addStatusListener((status) {
      ///当动画执行完毕时
      ///ontroller.forward() 方式启动时，执行完毕状态为completed
      if (status == AnimationStatus.completed) {
        controller.reset();
      }
    });

  }
  //lib/code20/main_data2116.dart
  ///   点击波浪效果
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }
  ///页面的主体
  buildBody1() {
    ratioValue=0.9;
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 点击波浪效果"),
      ),
      body:  Container(
        color: Colors.grey,
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: CustomPaint(
          size: Size(200, 100),
          ///手势识别
          child:GestureDetector(onTapDown: (detail){
            ///获取手势按下的位置
            ///localPosition获取的是当前显示的应用界面的位置
            ///globalPosition获取的是当前手指按下的在整个手机屏幕上的位置
            downSwiperOffset = detail.localPosition;
            controller.reset();
            controller.forward();
          },),
          painter: WaterWavesPainter(downSwiperOffset,ratioValue),
        ),
      ),
    );
  }
}

//lib/code20/main_data2116.dart
///  点击波浪效果
class WaterWavesPainter extends CustomPainter {
  ///波浪显示的中心点位置
  Offset downSwiperOffset;
  ///变化比率 0-1
  double flagRatio;
  ///创建画笔
  Paint _paint = new Paint()..isAntiAlias=true;


  WaterWavesPainter(this.downSwiperOffset,this.flagRatio);

  @override
  void paint(Canvas canvas, Size size) {

    _paint.color = Color.fromARGB((200*(1.0-flagRatio)).toInt(), 255, 255, 255);
    ///只有按下的时候绘制
    canvas.drawCircle(downSwiperOffset, size.width/4/4*2*flagRatio, _paint);
    ///只有按下的时候绘制
    _paint.color = Color.fromARGB((200*(1.0-flagRatio)).toInt(), 255, 255, 255);
    canvas.drawCircle(downSwiperOffset, size.width/4/4*3*flagRatio, _paint);
    ///只有按下的时候绘制
    _paint.color = Color.fromARGB((200*(1.0-flagRatio)).toInt(), 255, 255, 255);
    canvas.drawCircle(downSwiperOffset, size.width/4/4*flagRatio, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
