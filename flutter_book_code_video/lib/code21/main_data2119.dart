
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//lib/code20/main_data2118.dart
///   绘制阴影
class DrawShadowPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 绘制阴影"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(
                size: Size(200, 100),
//                child: XOYPage(),
                foregroundPainter: TextPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2118.dart
///  绘制阴影
class TextPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {

    drawCircleShadow(canvas);

  }
  drawCircleShadow(Canvas canvas){

    ///构建一个圆形Path
    Path reactPath =Path()..addOval(Rect.fromCircle(center: Offset(60,60),radius:50));
    ///绘制一个圆形的样式
    canvas.drawShadow(
        reactPath,
        ///黑色的阴影
        Colors.black,
        ///阴影的高度为3
        3,
        ///阴影不填充
        false);
  }
  drawReactShadow(Canvas canvas){
    ///构建一个矩形
    Rect rect = Rect.fromPoints(Offset(30.0,30.0), Offset(160.0,60.0));
    ///构建一个矩形Path
    Path reactPath =Path()..addRect(rect);
    ///绘制一个矩形状的样式
    canvas.drawShadow(
        reactPath,
        ///黑色的阴影
        Colors.black,
        ///阴影的高度为3
        3,
        ///阴影不填充
        false);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
