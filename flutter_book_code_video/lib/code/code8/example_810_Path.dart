import 'dart:math';
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
    home: Example810(),
  ));
}

class Example810 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Path"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: PathPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-10 Path 路径相关操作
/// lib/code/code8/example_810_Path.dart
class PathPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    //画笔笔触类型
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round
    //是否启动抗锯齿
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    buildPath6(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //构建Path Path的基本使用
  void buildPath1(Canvas canvas, Size size) {
    //创建Path
    Path path = new Path();
    //移动画笔到起点
    path.moveTo(100, 80);
    //画直线到点
    path.lineTo(100, 150);
    //继续画
    path.lineTo(160, 150);
    //闭合路径
    path.close();
    //绘制 Path
    canvas.drawPath(path, _paint);
  }

  //测试 StrokeCap
  void buildPath2(Canvas canvas, Size size) {
    _paint.strokeWidth = 10;
    //创建Path
    Path path = new Path();

    //移动画笔到起点
    path.moveTo(100, 80);
    //画直线到点
    path.lineTo(200, 80);
    //绘制 Path
    canvas.drawPath(path, _paint);
    //继续画
    _paint.strokeCap = StrokeCap.round;
    path.reset();
    path.moveTo(100, 100);
    path.lineTo(200, 100);
    //绘制 Path
    canvas.drawPath(path, _paint);
    //继续画
    _paint.strokeCap = StrokeCap.square;
    path.reset();
    path.moveTo(100, 120);
    path.lineTo(200, 120);
    //绘制 Path
    canvas.drawPath(path, _paint);
  }

  //构建Path Path的基本使用
  void buildPath3(Canvas canvas, Size size) {
    //创建Path
    Path path = new Path();
    //移动画笔到起点
    path.moveTo(100, 80);
    //画直线到点
    path.lineTo(100, 150);
    //继续画
    path.relativeLineTo(200, 0);
    //绘制 Path
    canvas.drawPath(path, _paint);
  }

  /// 代码清单 8-11 Path  添加弧
  /// lib/code/code8/example_810_Path.dart
  void buildPath4(Canvas canvas, Size size) {
    //创建Path
    Path path = new Path();
    //移动画笔到起点
    path.moveTo(100, 80);
    //画直线到点
    path.lineTo(200, 80);

    //添加一段弧
    //参数一为绘制弧所参考的外切矩形
    //参数二为 起始位置
    //参数三为 结束位置 2*pi为360度
    path.addArc(
        Rect.fromCenter(center: Offset(150, 80), width: 100, height: 100),
        0,
        0.5 * pi);

    //绘制 Path
    canvas.drawPath(path, _paint);
  }

  /// 代码清单 8-15 Path  二阶贝塞尔曲线
  /// lib/code/code8/example_810_Path.dart
  Paint _helpPaint = Paint()
    ..color = Colors.grey
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0;

  void buildPath5(Canvas canvas, Size size) {
    //定义起点
    Offset startPoint = Offset(50, 50);
    //定义控制点
    Offset controllPoint = Offset(100, 130);
    //定义终点
    Offset endPoint = Offset(250, 50);

    //创建Path
    Path path = new Path();
    //移动画笔到起点
    path.moveTo(startPoint.dx, startPoint.dy);
    //画二阶贝塞尔曲线

    //path.quadraticBezierTo(x1, y1, x2, y2)
    //参数(x1, y1) 就是控制点
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);

    //绘制 Path
    canvas.drawPath(path, _paint);

    ///--------------------------------------------------
    //绘制辅助线 起点到控制点
    canvas.drawLine(startPoint, controllPoint, _helpPaint);
    //绘制辅助线 控制点到终点
    canvas.drawLine(controllPoint, endPoint, _helpPaint);

    _helpPaint.strokeWidth = 10;
    //绘制辅助点
    canvas.drawPoints(
        PointMode.points, [startPoint, controllPoint, endPoint], _helpPaint);
  }

  /// 代码清单 8-16 Path  三阶贝塞尔曲线
  /// lib/code/code8/example_810_Path.dart
  void buildPath6(Canvas canvas, Size size) {
    //定义起点
    Offset startPoint = Offset(50, 50);
    //定义控制点
    Offset controllPoint1 = Offset(100, 150);
    Offset controllPoint2 = Offset(200, 130);
    //定义终点
    Offset endPoint = Offset(250, 50);

    //创建Path
    Path path = new Path();
    //移动画笔到起点
    path.moveTo(startPoint.dx, startPoint.dy);
    //画三阶贝塞尔曲线
    path.cubicTo(
        //控制点1
        controllPoint1.dx, controllPoint1.dy,
        //控制点2
        controllPoint2.dx, controllPoint2.dy,
        //终点
        endPoint.dx, endPoint.dy);

    //绘制 Path
    canvas.drawPath(path, _paint);

    ///--------------------------------------------------
    //绘制辅助线 起点到控制点
    canvas.drawLine(startPoint, controllPoint1, _helpPaint);
    //绘制辅助线 控制点1到控制点2
    canvas.drawLine(controllPoint1, controllPoint2, _helpPaint);
    //绘制辅助线 控制点到终点
    canvas.drawLine(controllPoint2, endPoint, _helpPaint);

    _helpPaint.strokeWidth = 10;
    //绘制辅助点
    canvas.drawPoints(PointMode.points,
        [startPoint, controllPoint1, controllPoint2, endPoint], _helpPaint);
  }
}
