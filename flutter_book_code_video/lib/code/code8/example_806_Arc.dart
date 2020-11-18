import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example806(),
  ));
}

class Example806 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘制弧"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: ArcPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-9  绘制弧或者饼
/// lib/code/code8/example_806_Arc.dart
class ArcPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //画笔颜色
    ..color = Colors.red
    //画笔的宽度
    ..style = PaintingStyle.fill
    ..strokeWidth = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    //创建矩形
    // Rect rect = Rect.fromLTRB(40, 40, 200, 200);
    Rect rect = Rect.fromLTRB(40, 40, 300, 200);

    drawBackground(rect,canvas,size);
    //绘制弧
    //参数一 参考的矩形范围
    //参数二 绘制弧的开始弧度，这里配置的为0，水平向右
    //参数三 绘制弧的结束弧度，
    //参数四 是否连接圆心
    canvas.drawArc(rect, 0, 2, true, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void drawBackground(Rect rect,Canvas canvas, Size size) {
    _paint.strokeWidth=2;
    _paint.style = PaintingStyle.stroke;
    _paint.color=Colors.blue;
    canvas.drawRect(rect,_paint);
    _paint.strokeWidth=4;
    _paint.color=Colors.red;
    _paint.style = PaintingStyle.stroke;
  }
}
