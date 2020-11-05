import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

import 'coupon_shape_border.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example2117(),
  ));
}

///代码清单 2-117
///lib/code/code2/example_appbar_2117_page.dart
class Example2117 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example2117> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        padding: EdgeInsets.all(20),
        //容器的高度
        height: double.infinity,
        child: Column(
          children: [
            buildBorder3(),
            SizedBox(
              height: 44,
            ),
            buildBorder2(),
            SizedBox(
              height: 44,
            ),
            buildBorder(),
          ],
        ),
      ),
    );
  }

  ///代码清单 2-119
  ///lib/code/code2/example_appbar_2117_page.dart
  Widget buildBorder() {
    return Material(
      //背景颜色
      color: Colors.orangeAccent,
      //阴影高度
      elevation: 2,
      //使用自定义的边框
      shape: SimpleShapeBoder(),
      //子Widget内容
      child: Container(
        //居中
        alignment: Alignment.center,
        //内边距
        padding: EdgeInsets.all(10),
        //高度
        height: 80,
        //文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildBorder2() {
    return Material(
      //背景颜色
      color: Colors.orangeAccent,
      //阴影高度
      elevation: 2,
      //使用自定义的边框
      shape: SimpleShapeBoder2(),
      //子Widget内容
      child: Container(
        //居中
        alignment: Alignment.center,
        //内边距
        padding: EdgeInsets.all(10),
        //高度
        height: 80,
        //文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildBorder3() {
    return Material(
      //背景颜色
      color: Colors.orangeAccent,
      //阴影高度
      elevation: 2,
      //使用自定义的边框
      shape: CouponShapeBorder(),
      //子Widget内容
      child: Container(
        //居中
        alignment: Alignment.center,
        //内边距
        padding: EdgeInsets.all(10),
        //高度
        height: 100,
        //文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  ///代码清单 2-123
  ///lib/code/code2/example_appbar_2117_page.dart
  ///构建手撕优惠券的Shape
  CouponShapeBorder couponShapeBorder() {
    return CouponShapeBorder(
      //虚线的颜色
        dashColor: Colors.blue,
        //是否是虚线
        dash: true,
        //是否绘制直线或者虚线
        useLine: true,
        //虚线的点数据
        dashCount: 10,
        //虚线的宽度
        dashWidth: 2.0,
        //虚线的绘制位置 [0.0,1.0]
        lineRate: 0.75,
        //上边框与下边框小洞的直径
        topRadius: 14.0,
        //左右两边加打动的个数
        holeCount: 6);
  }

}

///代码清单 2-117
///lib/code/code2/example_appbar_2117_page.dart
class SimpleShapeBoder extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    //创建画笔
    var paint = Paint()
      //画笔的颜色
      ..color = Colors.white
      //画笔的宽度
      ..strokeWidth = 2.0
      //画笔的样式为边框样式
      ..style = PaintingStyle.stroke
      //拐角处理使用圆角
      ..strokeJoin = StrokeJoin.round;
    //获取当前画布的宽度
    var w = rect.width;
    //获取当前画布的高度
    var h = rect.height;
    //绘制小圆圈 效果是一个白色的圆环
    canvas.drawCircle(Offset(0.3 * h, 0.23 * h), 0.12 * h, paint);
    //绘制黑色的小圆
    canvas.drawCircle(
        Offset(0.3 * h, 0.23 * h),
        0.06 * h,
        //修改画笔的颜色为填充模式
        //绘制出来的就是实心圆
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
    return null;
  }
}

///代码清单 2-118
///lib/code/code2/example_appbar_2117_page.dart
class SimpleShapeBoder2 extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    //创建画笔
    var paint = Paint()
      //画笔的颜色
      ..color = Colors.white
      //画笔的宽度
      ..strokeWidth = 2.0
      //画笔的样式为边框样式
      ..style = PaintingStyle.stroke
      //拐角处理使用圆角
      ..strokeJoin = StrokeJoin.round;
    //获取当前画布的宽度
    var w = rect.width;
    //获取当前画布的高度
    var h = rect.height;
    //绘制小圆圈 效果是一个白色的圆环
    canvas.drawCircle(Offset(0.3 * h, 0.23 * h), 0.12 * h, paint);
    //绘制黑色的小圆
    canvas.drawCircle(
        Offset(0.3 * h, 0.23 * h),
        0.06 * h,
        //修改画笔的颜色为填充模式
        //绘制出来的就是实心圆
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
  ///代码清单 2-120
  ///lib/code/code2/example_appbar_2117_page.dart
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    Path path = Path();
    //用来切割成圆角矩形边框
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)));

    double w = rect.width;
    //在左上角添加一个圆
    path.addOval(
        Rect.fromCenter(width: 18, height: 18, center: Offset(w - 22, 22)));
    // 奇偶环绕原则(EVEN_ODD)
    path.fillType = PathFillType.evenOdd;
    //因为与外边框相交的点数为0是一个偶数
    //所以这里添加的小圆是一个打洞效果的

    return path;
  }
}



