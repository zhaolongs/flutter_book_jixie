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
    home: Example808(),
  ));
}

class Example808 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘制圆形"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 400),
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-11 绘制圆形
/// lib/code/code8/example_808_Circl.dart
class CirclePainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
  ..color = Colors.blue
  ..style= PaintingStyle.stroke
  ..strokeWidth = 4.0;


  @override
  void paint(Canvas canvas, Size size) {
    //参数一指定的圆形位置
    //参数二指定的半径大小
    canvas.drawCircle(Offset(100,100), 40, _paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
