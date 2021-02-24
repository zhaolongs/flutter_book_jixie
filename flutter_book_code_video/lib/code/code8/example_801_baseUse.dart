
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
    home: Example801(),
  ));
}

/// 代码清单 8-1
///lib/code/code8/example_801_baseUse.dart
class Example801 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘图基本使用"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 200,
        //创建画板
        child: CustomPaint(
          //定义画板的大小
          size: Size(300, 300),
          //配置画布
          painter: LinePainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-2 自定义绘图者
///lib/code/code8/example_801_baseUse.dart

class LinePainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..strokeWidth = 4; //画笔宽度

  //绘制功能主要在这里进行
  @override
  void paint(Canvas canvas, Size size) {
    //绘制一条直线
    canvas.drawLine(Offset(20, 20), Offset(100, 20), _paint);
  }

  //是否重新绘制
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
