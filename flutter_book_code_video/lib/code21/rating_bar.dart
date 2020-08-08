import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/12.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */



const double kSize = 50.0;

class StaticRatingBar extends StatelessWidget {
  ///五角星的个数
  final int starsNumber;
  ///高亮显示五角星的个数
  final double selectStarsNumber;
  /// 五角星的大小 
  final double starsSize;
  ///高亮显示的颜色 
  final Color selectColor;
  ///默认显示的颜色
  final Color defaultColor;

  StaticRatingBar({
    this.selectStarsNumber=4.0,
    this.selectColor=Colors.deepOrange,
    this.defaultColor=Colors.grey,
    this.starsNumber=5,
    this.starsSize=160,
  });

  Widget buildStar() {
    return new SizedBox(
        width: starsSize * starsNumber,
        height: starsSize,
        child: new CustomPaint(
          painter: new _PainterStars(
              size: this.starsSize / 2,
              color: selectColor,
              style: PaintingStyle.fill,
              strokeWidth: 1.0),
        ));
  }

  ///构建底部显示的星
  Widget buildDefaultStarsWidget() {
    ///计算画布的大小
    return new SizedBox(
        ///每个星的大小 * 星的个数
        width: starsSize * starsNumber,
        ///星的高度
        height: starsSize,
        ///构建画板
        child: new CustomPaint(
          ///构建画布
          painter: new _PainterStars(
              size: this.starsSize / 2,
              color: defaultColor,
              style: PaintingStyle.fill,
              strokeWidth: 0.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        ///构建底部显示的星
        buildDefaultStarsWidget(),
        new ClipRect(
          clipper: new _RatingBarClipper(width: selectStarsNumber * starsSize),
          child: buildStar(),
        )
      ],
    );
  }
}

class _RatingBarClipper extends CustomClipper<Rect> {
  final double width;

  _RatingBarClipper({this.width}) : assert(width != null);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(_RatingBarClipper oldClipper) {
    return width != oldClipper.width;
  }
}

/// 角度转弧度公式
double degree2Radian(int degree) {
  return (Math.pi * degree / 180);
}

///构建五角星
///[radius]外切圆的半径
Path createStarPath(double radius, double radiusRatio, Path path) {
  /// 36为五角星的角度
  double radian = degree2Radian(36);
  double radius_in = (radius * Math.sin(radian / 2) / Math.cos(radian)) *
      radiusRatio; // 中间五边形的半径,太正不是很好看，扩大一点点
  ///移动到起点A点
  path.moveTo((radius * Math.cos(radian / 2)), 0.0);
  ///绘制直线到B点
  path.lineTo((radius * Math.cos(radian / 2) + radius_in * Math.sin(radian)),
      (radius - radius * Math.sin(radian / 2)));
  ///绘制直线到C点
  path.lineTo((radius * Math.cos(radian / 2) * 2),
      (radius - radius * Math.sin(radian / 2)));
  ///绘制到D点
  path.lineTo(
      (radius * Math.cos(radian / 2) + radius_in * Math.cos(radian / 2)),
      (radius + radius_in * Math.sin(radian / 2)));
  path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)),
      (radius + radius * Math.cos(radian)));
  path.lineTo((radius * Math.cos(radian / 2)), (radius + radius_in));
  path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)),
      (radius + radius * Math.cos(radian)));
  path.lineTo(
      (radius * Math.cos(radian / 2) - radius_in * Math.cos(radian / 2)),
      (radius + radius_in * Math.sin(radian / 2)));
  path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
  path.lineTo((radius * Math.cos(radian / 2) - radius_in * Math.sin(radian)),
      (radius - radius * Math.sin(radian / 2)));

  path.lineTo((radius * Math.cos(radian / 2)), 0.0);
  return path;
}

///绘制五角星的画布
class _PainterStars extends CustomPainter {
  ///绘制五角星的大小
  final double size;
  ///画布的颜色
  final Color color;
  ///画笔的样式
  final PaintingStyle style;
  ///边框的宽度
  final double strokeWidth;
  ///创建画笔
  Paint _startPaint = new Paint();

  _PainterStars({this.size, this.color, this.strokeWidth, this.style}) {
    ///画笔的边框
    _startPaint.strokeWidth = strokeWidth;
    ///画笔的颜色
    _startPaint.color = color;
    ///设置画笔的样式
    _startPaint.style = style;
  }

  @override
  void paint(Canvas canvas, Size size) {



    Path path = new Path();

    double offset = strokeWidth > 0 ? strokeWidth + 2 : 0.0;

    path = createStarPath(this.size - offset, 1.0, path);
//    path = path.shift(new Offset(this.size * 2, 0.0));
//    path = createStarPath(this.size - offset, 1.0, path);
//    path = path.shift(new Offset(this.size * 2, 0.0));
//    path = createStarPath(this.size - offset, 1.0, path);
//    path = path.shift(new Offset(this.size * 2, 0.0));
//    path = createStarPath(this.size - offset, 1.0, path);
//    path = path.shift(new Offset(this.size * 2, 0.0));
//    path = createStarPath(this.size - offset, 1.0, path);
//
//    if (offset > 0) {
//      path = path.shift(new Offset(offset, offset));
//    }
//    path.close();

    canvas.drawPath(path, _startPaint);



  }

  @override
  bool shouldRepaint(_PainterStars oldDelegate) {
    return oldDelegate.size != this.size;
  }
}