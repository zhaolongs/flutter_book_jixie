import 'dart:math';

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
    home: Example801(),
  ));
}

/// 代码清单 8-3
///lib/code/code8/example_802_baseUse.dart
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
          //指定画布大小
          size: Size(400, 400),
          //与代码清单 8-2 中的一致
          painter: LinePainter(),
          //child不为空时使用RepaintBoundary通过独立图层的方式
          //分离与父Widget绘制图层，避免不必要的重复绘制
          //更多业务场景中如自定义的 StatefulWidget
          child: RepaintBoundary(child: Text("测试数据")),
        ),
      ),
    );
  }
}

//自定义绘图者
class LinePainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    //画笔颜色
    ..color = Colors.blue
    //画笔笔触类型
    ..strokeCap = StrokeCap.round
    //是否启动抗锯齿
    ..isAntiAlias = true
    //颜色混合模式
    ..blendMode = BlendMode.exclusion
    //绘画风格，默认为填充
    ..style = PaintingStyle.fill
    //颜色渲染模式，一般是矩阵效果来改变的,但是flutter中只能使用颜色混合模式
    ..colorFilter = ColorFilter.mode(Colors.blueAccent, BlendMode.exclusion)
    //模糊遮罩效果，flutter中只有这个
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0)
    //颜色渲染模式的质量
    ..filterQuality = FilterQuality.high
    //画笔的宽度
    ..strokeWidth = 15.0;

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
