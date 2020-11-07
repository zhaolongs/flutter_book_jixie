import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/19.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code/code2/shape/coupon_shape_border.dart
///手撕优惠券的效果
class CouponShapeBorder extends ShapeBorder {
  ///两边洞的个数
  final int holeCount;
  ///分割线的位置
  final double lineRate;
  ///是否是虚线
  final bool dash;
  ///线的颜色
  final Color dashColor;
  ///线的宽度
  final double dashWidth;
  final int dashCount;
  ///是否绘制直线
  final bool useLine;
  ///上下边界的小圆的直径
  final double topRadius;

  CouponShapeBorder(
      {this.holeCount = 6,
        this.lineRate = 0.76,
        this.dash = true,
        this.dashWidth=2,
        this.dashCount=6,
        this.topRadius = 12.0,
        this.useLine=true,
        this.dashColor = Colors.white});

  @override
  EdgeInsetsGeometry get dimensions => this.dimensions;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }
  @override
  ShapeBorder scale(double t) {
    return null;
  }
  ///代码清单 2-66
  ///lib/code/code2/shape/coupon_shape_border.dart
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    ///当前画布的大小
    double w = rect.width;
    double h = rect.height;
    ///两侧的小圆圈的半径
    double d = h / (1 + 2 * holeCount);
    Path path = Path();
    ///使用矩形裁剪
    path.addRect(rect);
    ///构建左侧的小圆圈
    buildLeftHole(path, d);
    ///构建右侧的小圆圈
    buildRightHole(path, w, d);
    ///构建顶部的小圆圈
    buildTopHole(path, rect);
    ///构建底部的小圆圈
    buildBottomHole(path, rect);
    ///打洞
    path.fillType = PathFillType.evenOdd;

    return path;
  }

  ///代码清单 2-68
  ///lib/code/code2/shape/coupon_shape_border.dart
  ///构建底部的小圆圈
  void buildBottomHole(Path path, Rect rect) {
    ///添加圆弧
    path.addArc(
        Rect.fromCenter(
            //小圆的中心
            center: Offset(lineRate * rect.width, rect.height),
            width: topRadius,
            height: topRadius),
        pi,
        pi);
  }

  ///构建顶部的小圆圈
  void buildTopHole(Path path, Rect rect) {
    ///添加圆弧
    path.addArc(
        Rect.fromCenter(
            center: Offset(lineRate * rect.width, 0),
            width: topRadius,
            height: topRadius),
        0,
        pi);
  }

  ///代码清单 2-67
  ///lib/code/code2/shape/coupon_shape_border.dart
  ///构建左侧的小圆圈
  buildLeftHole(Path path, double diameter) {
    ///holeCount为小圆的个数
    for (int i = 0; i < holeCount; i++) {
      ///左边
      double left = -diameter / 2;
      ///右边
      double right = left + diameter;
      ///每一个小圆圈之间都相间隔一个
      ///所以这里乘以2
      double top = 0.0 + diameter + 2 * diameter * (i);
      double bottom = top + diameter;
      ///添加弧
      path.addArc(Rect.fromLTRB(left, top, right, bottom), -pi / 2, pi);
    }
  }

  ///构建右侧的小圆圈
  buildRightHole(Path path, double w, double diameter) {
    for (int i = 0; i < holeCount; i++) {
      double left = -diameter / 2 + w;
      double top = 0.0 + diameter + 2 * diameter * (i);
      double right = left + diameter;
      double bottom = top + diameter;
      path.addArc(Rect.fromLTRB(left, top, right, bottom), pi / 2, pi);
    }
  }


  ///代码清单 2-65
  ///lib/code/code2/shape/coupon_shape_border.dart
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    ///根据配置确定是否需要绘制直线
    if (useLine) {
      var paint = Paint()
      ///画笔的颜色
        ..color = dashColor
      ///绘制线的宽度
        ..strokeWidth = dashWidth
      ///模式为不填充
        ..style = PaintingStyle.stroke
      ///拐角处使用圆角
        ..strokeJoin = StrokeJoin.round;

      ///直线的起始点 d/2为小圆的半径
      Offset startOffset = Offset(lineRate * rect.width, topRadius/2);
      ///直线的终点
      Offset endOffset = Offset(lineRate * rect.width, rect.height - topRadius/2);
      if (dash) {
        ///绘制虚线 canvas 没有提供绘制虚线的功能
        ///所以这里是通过绘制若干个小直线来组合成
        double dashTotalHeight = rect.height - topRadius;
        ///计算虚线的长度 如绘制 10个虚线点 那相当于是
        ///要把绘制的高度分割成 20个小高度 因为有实有虚两部分组件
        double step = dashTotalHeight / dashCount / 2;
        ///循环绘制实绩
        for (int i = 0; i < dashCount; i++) {
          ///实线的起始点 每个起点要 间隔一个虚线长度 所以这里要乘2
          Offset itemStartOffset = Offset(startOffset.dx, topRadius/2 + step * i * 2);
          ///实线的终点
          Offset itemEndOffset = Offset(itemStartOffset.dx, itemStartOffset.dy + step);
          ///绘制实线
          canvas.drawLine(itemStartOffset, itemEndOffset, paint);
        }
      } else {
        ///绘制直线
        canvas.drawLine(startOffset, endOffset, paint);
      }
    }
  }



}
