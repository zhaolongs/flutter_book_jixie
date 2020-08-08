import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2115.dart
///   画布变换
class TagsPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 标签"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            height: 44,
            child: TagsMainPage(),
          )
        ],
      ),
    );
  }
}

GlobalKey _myKey = new GlobalKey();

class TagsMainPage extends StatefulWidget {
  TagsMainPage() : super(key: _myKey);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State {
  int currentSelect = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (detail) {
        ///获取手势按下的位置
        ///localPosition获取的是当前显示的应用界面的位置
        ///globalPosition获取的是当前手指按下的在整个手机屏幕上的位置
        Offset offset = detail.localPosition;
        Size size = MediaQuery.of(context).size;
        double width = size.width;
        double dx = offset.dx;
        if (dx < width / 2) {
          currentSelect = 1;
        } else {
          currentSelect = 2;
        }
        setState(() {});
      },
      child: Container(
        color: Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
          painter: RectPainter(currentSelect),
        ),
      ),
    );
  }
}

//lib/code20/main_data2115.dart
///  画布变换
class RectPainter extends CustomPainter {
  /// 画布变换
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..style = PaintingStyle.fill //画笔style为填充
    ..strokeWidth = 4.0; //画笔的宽度
  ///两个Tab间隔间距
  double spacint = 10;
  ///圆角半径
  double radius = 10.0;
  ///当前点击选中的标签
  int currentSelect = 1;
  ///选中的标签背景颜色
  Color selectColor = Colors.red;
  ///未选中的标签背景颜色
  Color normalColor = Colors.grey;

  RectPainter(this.currentSelect,{this.spacint=10,this.radius=10,this.selectColor=Colors.blue,this.normalColor=Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width / 2;
    double height = size.height;
    ///绘制左边的标签
    drawLeft(width, height, canvas);
    ///绘制右边的标签
    drawRight(width, height, canvas);
  }
  ///绘制右边的标签
  void drawRight(double width, double height, Canvas canvas) {
    _paint.strokeJoin = StrokeJoin.round;
    if (currentSelect == 2) {
      _paint.color = selectColor;
    } else {
      _paint.color = normalColor;
    }
    ///绘制右边的圆角矩形
    Rect rightRect = Rect.fromPoints(
        Offset(width + radius * 2, 0), Offset(width * 2, height));
    RRect rightRRect =
        RRect.fromRectAndRadius(rightRect, Radius.circular(radius));
    canvas.drawRRect(rightRRect, _paint);
    ///绘制右边的不规则Path
    Path rightPath = new Path()
      ..moveTo(width + 2 * spacint + radius, rightRect.top);
    rightPath.cubicTo(width + radius, rightRect.top, width + radius,
        rightRect.top - 1, width + radius, rightRect.top + radius / 4);
    //
    rightPath.lineTo(width, height);
    rightPath.lineTo(width + 2 * spacint + radius, height);
    //
    rightPath.close();

    ///绘制路径
    canvas.drawPath(rightPath, _paint);
  }

  void drawLeft(double width, double height, Canvas canvas) {
    _paint.strokeJoin = StrokeJoin.round;
    if (currentSelect == 1) {
      _paint.color = selectColor;
    } else {
      _paint.color = normalColor;
    }

    Rect leftRect =
        Rect.fromPoints(Offset(0, 0), Offset(width - 2 * spacint, height));
    RRect leftRRect =
        RRect.fromRectAndRadius(leftRect, Radius.circular(radius));
    canvas.drawRRect(leftRRect, _paint);

    ///将画笔的起点移动到点 A点(0,100)
    Path leftPath = new Path()
      ..moveTo(width - 2 * spacint - radius, leftRRect.top)
      ..lineTo(width - radius, leftRRect.top);
    leftPath.cubicTo(width, leftRRect.top, width, leftRRect.top, width,
        leftRRect.top + radius / 4);
    leftPath.lineTo(width - radius, height);
    leftPath.lineTo(width - 2 * spacint - radius, height);

    leftPath.close();

    ///绘制路径
    canvas.drawPath(leftPath, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
