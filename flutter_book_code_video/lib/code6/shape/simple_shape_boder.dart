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
///lib/code18/main_data129.dart
class SimpleShapeBoder extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    ///创建画笔
    var paint = Paint()

    ///画笔的颜色
      ..color = Colors.white

    ///画笔的宽度
      ..strokeWidth = 2.0

    ///画笔的样式为边框样式
      ..style = PaintingStyle.stroke

    ///拐角处理使用圆角
      ..strokeJoin = StrokeJoin.round;

    ///获取当前画布的宽度
    var w = rect.width;

    ///获取当前画布的高度
    var h = rect.height;

    ///绘制小圆圈 效果是一个白色的圆环
    canvas.drawCircle(Offset(0.3 * h, 0.23 * h), 0.12 * h, paint);

    ///绘制黑色的小圆
    canvas.drawCircle(
        Offset(0.3 * h, 0.23 * h),
        0.06 * h,

        ///修改画笔的颜色为填充模式
        ///绘制出来的就是实心圆
        paint
          ..style = PaintingStyle.fill
          ..color = Colors.black);
  }

  @override
  ShapeBorder scale(double t) {
    return null;
  }

  @override
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    var path = Path();

    ///用来切割成圆角矩形边框
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)));

    var w = rect.width;

    ///在左上角添加一个圆
    path.addOval(
        Rect.fromCenter(width: 18, height: 18, center: Offset(w - 22, 22)));
    // 奇偶环绕原则(EVEN_ODD)
    path.fillType = PathFillType.evenOdd;

    ///因为与外边框相交的点数为0是一个偶数
    ///所以这里添加的小圆是一个打洞效果的

    return path;
  }

  Path buildRRBorderPath(Rect rect, Path path) {
    ///裁剪一个圆角矩形
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(12)));
    return path;
  }
}