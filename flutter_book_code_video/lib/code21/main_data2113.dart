import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2113.dart
///  绘制 路径
class PathQQPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  bool isMove = false;
  AnimationController _controller;
  double appBarHeight = 10.0;
  double statusBarHeight = 0.0;
  double screenHeight = 0.0;
  double screenWidth = 0.0;
  Size end;
  Size begin;


  Animation<Size> movement;



  ///手指按下的点
  Offset downOffset = Offset(30, 30);
  ///消息点的位置
  Offset end1=Offset(30, 30);

  @override
  void initState() {
    super.initState();
    var appBar = new AppBar(title: new Text("drag"));
    appBarHeight = appBar.preferredSize.height;

  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    end = Size(30, 30);
    end1 = Offset(130, 30);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            CustomPaint(foregroundPainter: BezierPainter(downOffset, end1)),
            Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                left: 0,
                child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
//                    child: Text('12313'),
                    ),
                    onPanUpdate: (d) {
                      setState(() {
                        double dx = d.globalPosition.dx;
                        double dy = d.globalPosition.dy -
                            appBarHeight -
                            statusBarHeight;
                        downOffset = Offset(dx, dy);
                      });
                    },
                    onPanEnd: (d) {
                      begin = Size(downOffset.dx, downOffset.dy);
                      comeBack();
                      print('onPanEnd : ' + d.toString());
                    })),
          ],
        ),
      ),
    );
  }

  comeBack() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _controller.value;
    movement = SizeTween(
      begin: begin,
      end: end,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        // 动画执行时间所占比重
        curve: ElasticOutCurve(0.6),
      ),
    )
      ..addListener(() {
        setState(() {
          downOffset = Offset(movement.value.width, movement.value.height);
        });
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
      });
    _controller.reset();
    _controller.forward();
  }
}

//lib/code20/main_data2113.dart
///  绘制路径
class BezierPainter extends CustomPainter {
  ///手指按下的点
  Offset downOffset;
  ///
  Offset end;

  double lineWidth = 7;
  double ratio = 1;

  Paint _paint = Paint()..color = Colors.red;

  BezierPainter(Offset downOffset, Offset end) {
    if (downOffset == null) return;
    this.downOffset = Offset(downOffset.dx + 15, downOffset.dy + 15);
    this.end = Offset(end.dx + 15, end.dy + 15);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (downOffset == null) return;

    ///创建路径
    Path path = new Path();

    var angleA = atan((downOffset.dx - end.dx) / (end.dy - downOffset.dy));
    var length = ((downOffset.dx - end.dx) / sin(angleA)).abs();
    ratio = max(1 - length * 0.01, 0.2);
    if (length < 100) {
      var temp_dx = cos(angleA) * lineWidth;
      var temp_dy = sin(angleA) * lineWidth;
      var firstControlPoint = Offset(end.dx + (downOffset.dx - end.dx) / 2,
          downOffset.dy + (end.dy - downOffset.dy) / 2);
      var firstPoint = Offset(downOffset.dx + temp_dx, downOffset.dy + temp_dy);
      var secondPoint =
          Offset(end.dx - temp_dx * ratio, end.dy - temp_dy * ratio);

      /**
          p1                          p3
          |------------------------|
          |                        |
          |                        |
          |------------------------|
          p2                          p4
       */
      // 原点 -> p1
      path.moveTo(end.dx - temp_dx * ratio, end.dy - temp_dy * ratio);
      // p1 -> p2
      path.lineTo(end.dx + temp_dx * ratio, end.dy + temp_dy * ratio);
      // p2 -> p4
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstPoint.dx, firstPoint.dy);
      // p4 -> p3
      path.lineTo(downOffset.dx - temp_dx, downOffset.dy - temp_dy);
      // p3 -> p1
      path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          secondPoint.dx, secondPoint.dy);

      canvas.drawPath(path, _paint);
      canvas.drawCircle(end, lineWidth * ratio, _paint);
    }
    canvas.drawCircle(downOffset, lineWidth, _paint);

    // 文字
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );

    var tp = textPainter
      ..text = TextSpan(
        text: '3',
        style: new TextStyle(
          color: Colors.white,
          fontSize: 9.0,
        ),
      )
      ..layout();

    tp.paint(
        canvas, Offset(downOffset.dx - tp.width / 2, downOffset.dy - tp.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
