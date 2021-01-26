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
    home: Example803(),
  ));
}


class Example803 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 200,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          //与代码清单 8-2 中的一致
          painter: PointPainter(),
        ),
      ),
    );
  }
}
/// 代码清单 8-4 绘制点 drawPoints
///lib/code/code8/example_803_Point.dart
class PointPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //画笔颜色
    ..color = Colors.blue
    //画笔笔触类型
    ..strokeCap = StrokeCap.round
    //是否启动抗锯齿
    ..isAntiAlias = true
    //绘画风格，默认为填充
    ..style = PaintingStyle.fill
    //画笔的宽度
    ..strokeWidth = 20.0;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制点
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(0.0, 0.0),
          Offset(60.0, 10.0),
          Offset(50.0, 50.0),
          Offset(90.0, 90.0),
          Offset(190.0, 60.0),
        ],
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
