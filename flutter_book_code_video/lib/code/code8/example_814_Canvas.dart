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
    home: Example814(),
  ));
}

/// 代码清单 8-21 [Canvas] 画布的常用方法
/// lib/code/code8/example_813_Image.dart
class Example814 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example814State();
  }
}

class _Example814State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 绘制图片"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: RectPainter(),
        ),
      ),
    );
  }
}
/// 代码清单 8-21 [Canvas] 画布的常用方法
/// lib/code/code8/example_813_Image.dart
class RectPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制
    drawNormalRect(canvas);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawNormalRect(Canvas canvas) {
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(40, 40, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
  }

  /// 代码清单 8-22 [Canvas] 画布 旋转
  /// lib/code/code8/example_813_Image.dart
  void drawRoateRect(Canvas canvas) {
    //旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(40, 40, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
  }

  /// 代码清单 8-23 [Canvas] 画布 旋转 平移
  /// lib/code/code8/example_813_Image.dart
  // 画布变换之平移画布
  buildTranslateFunction(Canvas canvas) {
    //平移画布原点到点(40,40)
    canvas.translate(40,40);
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
  }
 // 画布变换之平移、旋转画布
  buildTranslateFunction2(Canvas canvas) {
    //平移画布原点到点(40,40)
    canvas.translate(40,40);
    //旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
  }

  /// 代码清单 8-24 [Canvas] 画布 旋转 平移
  /// lib/code/code8/example_813_Image.dart
  buildTranslateFunction3(Canvas canvas) {
    //平移画布原点到点(40,40)
    canvas.translate(40,40);
    //旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
    //绘制圆形
    canvas.drawCircle(Offset(200,200),50, _paint);
  }

  /// 代码清单 8-25 [Canvas] 画布 旋转 平移 合并重置
  /// lib/code/code8/example_813_Image.dart
  buildTranslateFunction4(Canvas canvas) {
    //保存状态
    canvas.save();
    //平移画布原点到点(40,40)
    canvas.translate(40,40);
    //旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    //根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    //left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    //绘制矩形
    canvas.drawRect(rect, _paint);
    //合并
    canvas.restore();
    //绘制圆形
    canvas.drawCircle(Offset(200,200),50, _paint);
  }

}
