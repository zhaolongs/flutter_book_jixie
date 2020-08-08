import 'dart:ui';

import 'package:flutter/material.dart';

///lib/code20/main_data2126.dart
///   绘制网格的坐标轴
class GriddingDemoPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
class _PageState extends State with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
////横屏
//    SystemChrome.setPreferredOrientations(
//        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
//    //全屏显示
//    SystemChrome.setEnabledSystemUIOverlays([]);
  }
  @override
  Widget build(BuildContext context) {
    ///构建画布
    return CustomPaint(
      ///自定义绘制
      painter: GriddingPainter(),
    );
  }
}

//lib/code20/main_data2126.dart
///绘制坐标轴
class GriddingPainter extends CustomPainter {

  ///用于绘制的画笔
  Paint _gridPaint;
  ///用于构建网格
  Path _gridPath;

  GriddingPainter() {
    _gridPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    _gridPath = Path();
  }


  @override
  void paint(Canvas canvas, Size size) {

    ///绘制背景颜色
    canvas.drawColor(Colors.white, BlendMode.color);
    ///平移画布中心
    canvas.translate(size.width / 2, size.height / 2);
    //绘制格线
    _drawGrid(canvas, size);
    //绘制xy轴线
    _drawAxis(canvas, size);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

//绘制格线
  void _drawGrid(Canvas canvas, Size size) {
    ///构建正方向的网格
    ///也就是在x>0，y>0的范围内进行绘制
    ///也就是第四象限的网格
    _gridPath = _buildGridPath(_gridPath, size);
   ///绘制
    canvas.drawPath(_gridPath, _gridPaint);

    //沿x轴镜像
    //也就是通过构建的第四象限的网格
    //绘制了第一象限的网格
    canvas.save();
    canvas.scale(1, -1);
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();
    //沿y轴镜像
    //绘制了第三象限的网格
    canvas.save();
    canvas.scale(-1, 1);
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();
    //沿原点镜像
    //绘制了第二象限的网格
    //第二象限与第四象限原点对称
    canvas.save();
    canvas.scale(-1, -1);
    canvas.drawPath(_gridPath, _gridPaint);
    canvas.restore();
  }

  ///绘制坐标轴
  void _drawAxis(Canvas canvas, Size size) {
    canvas.drawPoints(
        PointMode.lines,
        [
          ///x轴的起点
          Offset(-size.width / 2, 0),
          ///x轴的终点
          Offset(size.width / 2, 0),
          //y轴的起点
          Offset(0, -size.height / 2),
          ///y轴的终点
          Offset(0, size.height / 2),
          Offset(0, size.height / 2),
          ///y轴的箭头左半部分
          Offset(0 - 7.0, size.height / 2 - 10),
          Offset(0, size.height / 2),
          ///y轴的箭头右半部分
          Offset(0 + 7.0, size.height / 2 - 10),
          Offset(size.width / 2, 0),
          ///x轴的箭头上半部分
          Offset(size.width / 2 - 10, 7),
          Offset(size.width / 2, 0),
          ///x轴的箭头下半部分
          Offset(size.width / 2 - 10, -7),
        ],
        _gridPaint
          ..color = Colors.blue
          ..strokeWidth = 1.5);
  }

  ///[step]为网格间隔
  ///[size]为画布大小
  ///[path]路径构建
  Path _buildGridPath(Path path, Size size, {step = 20.0}) {
    ///计算可以绘制水平线的格数
    num stepHeightNumber = size.height / 2 / step;
    ///构建横线
    for (int i = 0; i < stepHeightNumber; i++) {
      ///移动到画笔的起点 在y轴上的点
      path.moveTo(0, step * i);
      ///相对于起点横向绘制
      ///也就是绘制了一条长度为size.width / 2的水平横线
      path.relativeLineTo(size.width / 2, 0);
    }
    ///计算可以绘制竖直线的格数
    num stepWidthNumber = size.width / 2 / step;
    ///绘制纵线
    for (int i = 0; i < stepWidthNumber; i++) {
      ///移动到画笔的起点 在x轴上的点
      path.moveTo(step * i, 0);
      ///相对于起点竖直绘制
      ///也就是绘制了一条长度为size.height / 2的垂直竖线
      path.relativeLineTo(0, size.height / 2,
      );
    }
    return path;
  }
}
