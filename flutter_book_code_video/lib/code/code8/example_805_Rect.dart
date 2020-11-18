import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example805(),
  ));
}

class Example805 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘制矩形"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: RectPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-8  矩形
/// lib/code/code8/example_805_Rect.dart
class RectPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 2.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    //创建一个矩形
    Rect rect = buildRect5();
    //绘制矩形
    canvas.drawRect(rect, _paint);
  }

  //创建矩形方式一
  Rect buildRect1() {
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    return Rect.fromLTRB(20, 40, 150, 100);
  }

  //创建矩形方式二
  Rect buildRect2() {
    //根据设置左上角的点与矩形宽高来绘制；
    //left,  top,  width, height
    return Rect.fromLTWH(20, 40, 150, 100);
  }

  //创建矩形方式三
  Rect buildRect3() {
    //根据根据圆形绘制正方形
    //参数一 center Offset类型，参考圆形的中心
    //参数二 radius 以center为圆心，以radius为半径
    return Rect.fromCircle(center: Offset(100, 100), radius: 50);
  }

  //创建矩形方式四
  Rect buildRect4() {
    //根据根据中心点绘制正方形
    //参数一 center Offset类型，参考圆形的中心
    //参数二 width
    //参数三 height
    return Rect.fromCenter(center: Offset(100, 100), width: 100, height: 100);
  }

  //创建矩形方式五
  Rect buildRect5() {
    //根据根对角点来绘制矩形
    //参数一 矩形的左上角的点
    //参数二 矩形右下角的点
    return Rect.fromPoints(Offset(60, 50), Offset(200, 100));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
