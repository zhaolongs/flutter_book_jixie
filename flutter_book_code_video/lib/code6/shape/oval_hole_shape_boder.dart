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


///lib/code6/shape/oval_hole_shape_boder.dart
///打洞效果的Shape
class OvalHoleShapeBoder extends ShapeBorder {
  ///打洞小圆的中心 取值范围为 (0,1.0)
  ///在构建Path时是通过这里的值来乘以宽高的
  final Offset offset;
  ///打洞小圆的半径
  final double size;
  ///圆角边框的圆角大小
  final double borderRadius;

  OvalHoleShapeBoder(
      {this.offset = const Offset(0.05, 0.2),
        this.size = 20,
        this.borderRadius = 10});

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(5)));
    return path;
  }

  ///getOuterPath 返回一个Path对象，也就是形状的裁剪
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();

    ///圆角矩形
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));
    var w = rect.width;
    var h = rect.height;
    ///计算打洞的小圆的中心
    var offsetXY = Offset(offset.dx * w, offset.dy * h);
    ///添加圆
    path.addOval(Rect.fromCenter(center: offsetXY,width: size,height: size));
    //奇偶环绕原则(EVEN_ODD)
    path.fillType = PathFillType.evenOdd;
    return path;
  }


  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
  }

  @override
  EdgeInsetsGeometry get dimensions => this.dimensions;

  @override
  ShapeBorder scale(double t) {
    return null;
  }
}
