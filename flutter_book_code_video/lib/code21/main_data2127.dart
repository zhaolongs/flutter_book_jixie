
import 'dart:ui';

import 'package:flutter/material.dart';

import 'main_data2126.dart';

///   二阶贝塞尔曲线演示
class DrawBezierDemoPage2 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code20/main_data2127.dart
class _PageState extends State {

  ///记录手指在屏幕上的位置
  Offset _pointerOffset=Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///手指按下
      onPanDown: (detail) {
       setState(() {
         ///获取相对于父组件的位置
         _pointerOffset = detail.localPosition;
       });
      },
     ///手指移动
      onPanUpdate: (detail) {
        setState(() {
          _pointerOffset = detail.localPosition;
        });
      },
      child: CustomPaint(
        ///网格坐标轴
        painter: GriddingPainter(),
        /// 二阶贝塞尔曲线演示
        foregroundPainter: BezierDemoPainter( _pointerOffset),
      ),
    );
  }
}


//lib/code20/main_data2127.dart
///贝塞尔曲线的起点A点
Offset p0 = Offset(0, 0);
///贝塞尔曲线的控制点B点
Offset p1 = Offset(100, 100);
///贝塞尔曲线的终点C点
Offset p2 = Offset(120, -60);
/// 二阶贝塞尔曲线演示画布
class BezierDemoPainter extends CustomPainter {



  ///绘制曲线使用的画笔
  Paint _mainPaint;
  ///构建曲线使用的Path
  Path _mainPath;
  ///绘制辅助线使用的画笔
  Paint _helpPaint;
  ///记录手指按下的点位
  Offset pointerOffset;


  BezierDemoPainter(this.pointerOffset){

    _mainPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    _mainPath = Path();

    _helpPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }




  @override
  void paint(Canvas canvas, Size size) {
    ///绘制点
    _judge(pointerOffset - Offset(size.width / 2, size.height / 2));

    ///绘制背景
    canvas.drawColor(Colors.white, BlendMode.color);
    ///平移原点到画布中心
    canvas.translate(size.width / 2, size.height / 2);

    ///绘制三个圆圈触摸范围
    canvas.drawCircle(p0, 25, _helpPaint);
    canvas.drawCircle(p1, 25, _helpPaint);
    canvas.drawCircle(p2, 25, _helpPaint);
    ///将画笔移动到起点
    _mainPath.moveTo(p0.dx, p0.dy);
    ///二阶贝塞尔曲线构建
    _mainPath.quadraticBezierTo(
        ///控制点
        p1.dx, p1.dy,
        ///终点
        p2.dx, p2.dy);
    ///绘制
    canvas.drawPath(_mainPath, _mainPaint);

     ///绘制辅助线
    _drawHelp(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;




  ///绘制辅助线与点
  void _drawHelp(Canvas canvas) {
    ///绘制起点到控制点的辅助线
    canvas.drawPoints(
        PointMode.lines, [p0, p1, p1, p2], _helpPaint..strokeWidth = 1);
    ///绘制三个点效果
    canvas.drawPoints(
        PointMode.points, [p0, p1, p2], _helpPaint..strokeWidth = 8);
  }

  ///判断手指按下的点位是否在三个点的触摸范围内
  ///如果是就将触摸的点赋值给对应的点
  ///从而达到动态拖动的效果
  void _judge(Offset src) {
    ///起点
    if (judgeCircleArea(src, p0, 25)) {
      p0 = src;
    }
    ///控制点
    if (judgeCircleArea(src, p1, 25)) {
      p1 = src;
    }
    ///终点
    if (judgeCircleArea(src, p2, 25)) {
      p2 = src;
    }
  }

  ///判断出是否在某点的半径为r圆范围内
  ///13.1.8 判断按下的点是否在固定半径区域内 小节中有分析说明
  bool judgeCircleArea(Offset src, Offset dst, double r) =>
      (src - dst).distance <= r;
}
