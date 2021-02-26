import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example809(),
  ));
}

class Example809 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘制椭圆"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: OvalPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-9 绘制椭圆形
/// lib/code/code8/example_809_Oval.dart
class OvalPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);
    //绘制椭圆
    canvas.drawOval(rect, _paint);

    //使用两个对角点来创建width为150 height为100的矩形
    Rect rect2 = Rect.fromPoints(Offset(200, 50), Offset(350, 150));
    //绘制椭圆
    canvas.drawOval(rect2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
