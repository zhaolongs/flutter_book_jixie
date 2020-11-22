import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutterbookcode/utils/image_loader_utils.dart';

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
    home: Example816(),
  ));
}

/// 代码清单 8-27 绘制直线
/// lib/code/code8/example_816_Line_Animation.dart
///
/// 代码清单 8-29 绘制Path动画
/// lib/code/code8/example_816_Line_Animation.dart
class Example816 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //创建
    _animationController = new AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 2.0,
        duration: Duration(
          milliseconds: 1600,
        ));
    //添加监听
    _animationController.addListener(() {
      setState(() {});
    });
    //添加状态监听
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("绘图动画"),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            height: 150,
            child: CustomPaint(
              size: Size(400, 150),
              painter: LineAndArcPainter(progress: _animationController.value),
              // ProgressLinePainter(progress: _animationController.value),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                child: Text("开始"),
                onPressed: () {
                  _animationController.reset();
                  _animationController.forward();
                },
              ),
              SizedBox(
                width: 12,
              ),
              ElevatedButton(
                child: Text("结束"),
                onPressed: () {
                  _animationController.stop();
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter({this.progress});

  Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  /// 代码清单 8-25 绘制直线
  /// lib/code/code8/example_816_Line_Animation.dart
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(50, 50);
    path.lineTo(
      250,
      50,
    );
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// 代码清单 8-26 绘制直线
/// lib/code/code8/example_816_Line_Animation.dart
class ProgressLinePainter extends CustomPainter {
  //进度 0.0 ~ 1.0
  final double progress;

  ProgressLinePainter({this.progress});

  Paint _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;
  Path path = new Path();

  @override
  void paint(Canvas canvas, Size size) {
    //重置路径

    path.reset();

    canvas.save();
    path.moveTo(50, 50);
    //动态修改
    path.lineTo(
      50 + 200 * progress,
      50,
    );
    canvas.drawPath(path, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(ProgressLinePainter oldDelegate) {
    return true;
  }
}

/// 代码清单 8-28
/// lib/code/code8/example_816_Line_Animation.dart
class LineAndArcPainter extends CustomPainter {
  //进度 0.0 ~ 2.0
  final double progress;

  LineAndArcPainter({this.progress});

  Paint _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;
  Path path = new Path();

  @override
  void paint(Canvas canvas, Size size) {
    //重置路径
    path.reset();

    canvas.save();
    //画一条直线 这个直线的长度为 100
    //也就是这条直线对应的Path长度为 400
    path.moveTo(50, 50);
    path.lineTo(
      150,
      50,
    );

    //添加一个矩形 宽高分别为 100，周长发 400
    //也就是矩形对应的 Path长度为 400
    path.addRect(Rect.fromLTWH(150, 50, 100, 100));

    //获取Path中所有的组成单元（在这里应该是2个）
    PathMetrics computeMetrics = path.computeMetrics();
    int number = computeMetrics.length;

    print("path number $number");

    //获取直线相关的 PathMetric
    PathMetric linePathMetric = path.computeMetrics().first;
    //直线的长度
    double linePathLength = linePathMetric.length;

    //获取矩形相关的 PathMetric
    PathMetric rectPathMetric = path.computeMetrics().elementAt(1);
    //矩形的长度
    double rectPathLength = rectPathMetric.length;



    //在 0.0 ~ 1.0 之间绘制直线
    //在 1.0 ~ 2.0 之间绘制矩形
    double lineExtracProgress = 0;
    double rectExtracProgress =0;
    if(progress>1.0){
      //根据进度绘制矩形的长度
      rectExtracProgress =rectPathMetric.length * (progress-1.0);
      //绘制直线的全部
      lineExtracProgress = linePathMetric.length;
    }else{
      //动态绘制直线
      lineExtracProgress = linePathMetric.length * progress;
    }


    //构建指定长度的 Path
    //测量并裁剪路径
    Path lineExtractPath = linePathMetric.extractPath(
        //参数一 开始测量的路径长度位置
        //参数二 结束测量的路径长度位置
        0.0,
        lineExtracProgress);

    Path rectExtractPath = rectPathMetric.extractPath(
        //参数一 开始测量的路径长度位置
        //参数二 结束测量的路径长度位置
        0.0,
        rectExtracProgress);

    //合并这两个Path
    lineExtractPath.addPath(rectExtractPath, Offset.zero);

    print("path linePathLength $linePathLength");
    print("path rectPathLength $rectPathLength");
    print("path progress $progress");

    //绘制原 Path
    _paint.color = Colors.grey[300];
    canvas.drawPath(path, _paint);

    //绘制新组合创建的 Path
    _paint.color = Colors.red;
    canvas.drawPath(lineExtractPath, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
