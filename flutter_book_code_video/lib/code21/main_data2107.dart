import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2107.dart
///  绘制 矩形
class DrawReactPage extends StatefulWidget {
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
        title: Text("Canvas 绘制矩形"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(
                size: Size(200, 100),
//                child: XOYPage(),
                foregroundPainter: RectPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2107.dart
///  绘制矩形
class RectPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..style= PaintingStyle.fill //画笔style为填充
    ..strokeWidth = 4.0; //画笔的宽度


  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = buildRect1();
    rect = buildRect2();
    rect =buildRect3();
    rect =buildRect4();
    rect =buildRect5();
    ///绘制矩形
    canvas.drawRect(rect, _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //lib/code20/main_data2107.dart
  ///创建矩形方式一
  Rect buildRect1(){
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    return Rect.fromLTRB(20, 40, 150, 100);
  }

  //lib/code20/main_data2107.dart
  ///创建矩形方式二
  Rect buildRect2(){
    ///根据设置左上角的点与矩形宽高来绘制；
    ///left,  top,  width, height
    return Rect.fromLTWH(20, 40, 150, 100);
  }
  //lib/code20/main_data2107.dart
  ///创建矩形方式3
  Rect buildRect3(){
    ///根据根据圆形绘制正方形
    ///参数一 center Offset类型，参考圆形的中心
    ///参数二 radius 以center为圆心，以radius为半径
    return Rect.fromCircle(center:Offset(100,100),radius:50);
  }

  //lib/code20/main_data2107.dart
  ///创建矩形方式4
  Rect buildRect4(){
    ///根据根据中心点绘制正方形
    ///参数一 center Offset类型，参考圆形的中心
    ///参数二 width
    ///参数三 height
    return Rect.fromCenter(center:Offset(100,100),width: 100,height: 100);
  }
  //lib/code20/main_data2107.dart
  ///创建矩形方式5
  Rect buildRect5(){
    ///根据根对角点来绘制矩形
    ///参数一 矩形的左上角的点
    ///参数二 矩形右下角的点
    return Rect.fromPoints(Offset(30,50),Offset(200,100));
  }



}
