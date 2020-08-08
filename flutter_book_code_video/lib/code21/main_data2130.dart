import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

///   三阶贝塞尔曲线演示
class RatingPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code20/main_data2128.dart
class _PageState extends State with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    super.dispose();
  }

  ///记录手指在屏幕上的位置
  Offset _pointerOffset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("五角星"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GestureDetector(
          ///手指按下
          onPanDown: (detail) {
            setState(() {
              print("D");

              ///获取相对于父组件的位置
              _pointerOffset = detail.localPosition;
            });
          },

          ///手指移动
          onHorizontalDragUpdate: (detail) {
            setState(() {
              _pointerOffset = detail.localPosition;
              print("t");
            });
          },
          child: Container(
            height: 200,
            width: 300,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: 0.1,
                child: CustomPaint(
                  /// 三阶贝塞尔曲线演示
                  painter: OneStarPainter(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//lib/code20/main_data2128.dart

class BezierDemoPainter extends CustomPainter {
  ///绘制背景使用的画笔
  Paint _backGroundPaint;

  ///绘制高亮使用的画笔
  Paint _mainPaint;

  ///绘制辅助线使用的画笔
  Paint _helpPaint;

  ///记录手指按下的点位
  Offset pointerOffset;

  BezierDemoPainter(this.pointerOffset) {
    _backGroundPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true
      ..strokeWidth = 2;
    _mainPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..isAntiAlias = true
      ..strokeWidth = 2;

    _helpPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  double radius = 20;
  double pointRadius = 8;
  int initStarNumber = 4;
  int totalStarNumber = 5;
  double space = 10.0;

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制背景

    Path path = new Path();
    for (int i = 0; i < totalStarNumber; i++) {
      path = createStarPath(path);
      path = path.shift(Offset(radius * 2 + space, 0));
    }
    canvas.drawPath(path, _backGroundPaint);

    Path mainPath = new Path();
    for (int i = 0; i < initStarNumber; i++) {
      mainPath = createStarPath(mainPath);
      mainPath = mainPath.shift(Offset(radius * 2 + space, 0));
    }
    canvas.drawPath(mainPath, _mainPaint);
  }

  Path createStarPath(Path path, {Canvas canvas}) {
    ///五角星的顶点角度为36
    ///转为弧度
    double radian = degree2Radian(36);

    ///A点为起点
    Offset A = Offset(radius, 0);

    ///五边形垂线的长度
    double verticalLine = radius * sin(radian / 2);

    ///五边形的边长
    double slideLength = tan(radian) * verticalLine * 2;

    ///五边形的对角线长度
    double diagonalLength = verticalLine / cos(radian);

    /// B点的坐标与C点相同
    double by = radius - verticalLine;
    double bx = radius + slideLength / 2;
    Offset B = Offset(bx, by);

    ///C点的坐标计算
    double cy = by;
    double cx = radius + radius * cos(radian / 2);
    Offset C = Offset(cx, cy);

    ///D点的坐标计算
    double dy = radius + diagonalLength * sin(radian / 2);
    double dx = radius + diagonalLength * cos(radian / 2);
    Offset D = Offset(dx, dy);

    ///E点的坐标计算
    double ey = radius + radius * sin(radian * 1.5);
    double ex = radius + radius * cos(radian * 1.5);
    Offset E = Offset(ex, ey);

    ///F点的坐标计算
    double fy = radius + diagonalLength;
    double fx = radius;
    Offset F = Offset(fx, fy);

    ///G点的坐标计算
    ///G点相对于E点对称
    Offset G = calculateSymmetricPoint(E, Offset(radius, E.dy));

    ///H点的坐标计算
    ///H点相对于D点对称
    Offset H = calculateSymmetricPoint(D, Offset(radius, D.dy));

    ///K点的坐标计算
    ///K点相对于C点对称
    Offset K = calculateSymmetricPoint(C, Offset(radius, C.dy));

    ///L点的坐标计算
    ///L点相对于B点对称
    Offset L = calculateSymmetricPoint(B, Offset(radius, B.dy));

    path.moveTo(A.dx, A.dy);
    path.lineTo(B.dx, B.dy);
    path.lineTo(C.dx, C.dy);
    path.lineTo(D.dx, D.dy);
    path.lineTo(E.dx, E.dy);
    path.lineTo(F.dx, F.dy);
    path.lineTo(G.dx, G.dy);
    path.lineTo(H.dx, H.dy);
    path.lineTo(K.dx, K.dy);
    path.lineTo(L.dx, L.dy);
    path.close();

    if (canvas != null) {
      canvas.drawCircle(A, pointRadius, _helpPaint);
      canvas.drawCircle(B, pointRadius, _helpPaint);
      canvas.drawCircle(C, pointRadius, _helpPaint);
      canvas.drawCircle(D, pointRadius, _helpPaint);
      canvas.drawCircle(E, pointRadius, _helpPaint);
      canvas.drawCircle(F, pointRadius, _helpPaint);
      canvas.drawCircle(G, pointRadius, _helpPaint);
      canvas.drawCircle(H, pointRadius, _helpPaint);
      canvas.drawCircle(K, pointRadius, _helpPaint);
      canvas.drawCircle(L, pointRadius, _helpPaint);
    }

    return path;
  }

  /// 求点A（m,n)关于点P(a,b)的对称点B(x,y)
  ///(m+x)/2=a ,x=2a-m
  ///(n+y)/2=b ,y=2b-n
  Offset calculateSymmetricPoint(Offset A, Offset P) {
    return Offset(2 * P.dx - A.dx, 2 * P.dy - A.dy);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class OneStarPainter extends CustomPainter {
  ///绘制使用的画笔
  Paint _mainPaint;

  ///绘制辅助线使用的画笔
  Paint _helpPaint;


  OneStarPainter() {
    _mainPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round //画笔笔触类型
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true
      ..strokeWidth = 2;

    _helpPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
  }

  double radius = 100;
  double pointRadius = 4;
  double excursionOffset = 10;

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  @override
  void paint(Canvas canvas, Size size) {
    ///绘制背景

    Path mainPath = new Path();

    mainPath = createStarPath(
      mainPath,
    );
    canvas.drawPath(mainPath, _mainPaint);



  }

  Path createStarPath(Path path, {Canvas canvas}) {
    ///五角星的顶点角度为36
    ///转为弧度
    double radian = degree2Radian(36);

    ///A点为起点
    Offset A = Offset(radius, 0);

    ///五边形垂线的长度
    double verticalLine = radius * sin(radian / 2);

    ///五边形的边长
    double slideLength = tan(radian) * verticalLine * 2;

    ///五边形的对角线长度
    double diagonalLength = verticalLine / cos(radian);

    /// B点的坐标与C点相同
    double by = radius - verticalLine;
    double bx = radius + slideLength / 2;
    Offset B = Offset(bx, by);

    ///C点的坐标计算
    double cy = by;
    double cx = radius + radius * cos(radian / 2);
    Offset C = Offset(cx, cy);

    ///D点的坐标计算
    double dy = radius + diagonalLength * sin(radian / 2);
    double dx = radius + diagonalLength * cos(radian / 2);
    Offset D = Offset(dx, dy);

    ///E点的坐标计算
    double ey = radius + radius * sin(radian * 1.5);
    double ex = radius + radius * cos(radian * 1.5);
    Offset E = Offset(ex, ey);

    ///F点的坐标计算
    double fy = radius + diagonalLength;
    double fx = radius;
    Offset F = Offset(fx, fy);

    ///G点的坐标计算
    ///G点相对于E点对称
    Offset G = calculateSymmetricPoint(E, Offset(radius, E.dy));

    ///H点的坐标计算
    ///H点相对于D点对称
    Offset H = calculateSymmetricPoint(D, Offset(radius, D.dy));

    ///K点的坐标计算
    ///K点相对于C点对称
    Offset K = calculateSymmetricPoint(C, Offset(radius, C.dy));

    ///L点的坐标计算
    ///L点相对于B点对称
    Offset L = calculateSymmetricPoint(B, Offset(radius, B.dy));

    path.moveTo(A.dx, A.dy);
    path.lineTo(B.dx, B.dy);
    path.lineTo(C.dx, C.dy);
    path.lineTo(D.dx, D.dy);
    path.lineTo(E.dx, E.dy);
    path.lineTo(F.dx, F.dy);
    path.lineTo(G.dx, G.dy);
    path.lineTo(H.dx, H.dy);
    path.lineTo(K.dx, K.dy);
    path.lineTo(L.dx, L.dy);
    path.close();

    if (canvas != null) {
      canvas.drawCircle(A, pointRadius, _helpPaint);
      canvas.drawCircle(B, pointRadius, _helpPaint);
      canvas.drawCircle(C, pointRadius, _helpPaint);
      canvas.drawCircle(D, pointRadius, _helpPaint);
      canvas.drawCircle(E, pointRadius, _helpPaint);
      canvas.drawCircle(F, pointRadius, _helpPaint);
      canvas.drawCircle(G, pointRadius, _helpPaint);
      canvas.drawCircle(H, pointRadius, _helpPaint);
      canvas.drawCircle(K, pointRadius, _helpPaint);
      canvas.drawCircle(L, pointRadius, _helpPaint);
    }

    return path;
  }

  /// 求点A（m,n)关于点P(a,b)的对称点B(x,y)
  ///(m+x)/2=a ,x=2a-m
  ///(n+y)/2=b ,y=2b-n
  Offset calculateSymmetricPoint(Offset A, Offset P) {
    return Offset(2 * P.dx - A.dx, 2 * P.dy - A.dy);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
