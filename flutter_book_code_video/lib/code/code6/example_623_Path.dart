import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// gongzhonghao biglead
// https://study.163.com/instructor/1021406208.htm
// https://blog.csdn.net/zl1
// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example623(),
  ));
}

/// 代码清单 6-27 Path 动画
/// 动态画线动画方式绘制矩形
///lib/code/code6/example_622_Hero.dart
class Example623 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {

  //创建动画控制器
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //创建动画控制器 0.0 ~ 1.0 执行时间 1400 毫秒
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1400),
    );

    //实时刷新
    animationController.addListener(() {
      setState(() {});
    });

    //动画状态监听
    animationController.addStatusListener((status) {
      //反复执行
      if (status == AnimationStatus.completed) {
        animationController.reset();
        animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  /// 代码清单 6-28
  ///lib/code/code6/example_622_Hero.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Path 动画 "),
      ),
      //线性排列
      body: Column(
        children: [
          //第一部分 画布
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Color(0xfffbfbfb),
            child: CustomPaint(
              //画布
              painter: PathAnimationPainter(animationController.value),
            ),
          ),
          //第二部分 按钮区域
          buildContainer()
        ],
      ),
    );
  }
  /// 代码清单 6-29
  ///lib/code/code6/example_622_Hero.dart
  Container buildContainer() {
    return Container(
      child: Row(
        //子Widget居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("开始"),
            onPressed: () {
              //正向执行动画
              animationController.forward();
            },
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton(
            child: Text("停止"),
            onPressed: () {
              //正向执行动画
              animationController.reset();
            },
          ),
        ],
      ),
    );
  }
}

/// 代码清单 6-30
///lib/code/code6/example_622_Hero.dart
class PathAnimationPainter extends CustomPainter {
  //[定义画笔]
  Paint _paint = Paint()
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度
  //当前绘制的进度
  double _progress;
  //构建函数
  PathAnimationPainter(this._progress);

  //绘制操作
  @override
  void paint(Canvas canvas, Size size) {
    canvasFunction(canvas);
  }

  //实时刷新
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  /// 代码清单 6-31
  ///lib/code/code6/example_622_Hero.dart
  void canvasFunction(Canvas canvas) {
    //创建一个路径
    Path startPath = new Path();
    //向路径中添加一个矩形
    startPath.addRect(
        Rect.fromCenter(center: Offset(100, 100), width: 150, height: 100));

    //测量路径 获取到这个路径中所有的组合单元
    //将每个单元信息封装到[PathMetric]中
    PathMetrics pathMetrics = startPath.computeMetrics();
    //遍历Path中的每个单元信息
    pathMetrics.forEach((PathMetric element) {
      //路径长度
      double length = element.length;
      //是否闭合
      bool isColosed = element.isClosed;
      //角标索引
      int index = element.contourIndex;

      print("测量 当前单元的长度为 $length 闭合 $isColosed 角标索引 $index");
    });

    //获取第一个单元
    PathMetric pathMetric = startPath.computeMetrics().first;

    //测量并裁剪路径
    Path extractPath = pathMetric.extractPath(
        //参数一 开始测量的路径长度位置
        //参数二 结束测量的路径长度位置
        0.0,
        pathMetric.length * _progress);

    _paint.color = Colors.grey[200];
    //绘制原路径 充当背景
    canvas.drawPath(startPath, _paint);

    _paint.color = Colors.blue;
    //绘制测量裁剪后的路径
    canvas.drawPath(extractPath, _paint);
  }
}
