import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/utils/canvas_path_utils.dart';

///7 /lib/code21/main_data2132.dart
///  N角绘制
class NStarPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  int starFlag = 3;
  int starType = 1;
  bool isBorder=false;
  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("N角绘制"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 40),
              color: Colors.grey[200],
              width: 400,
              height: 400,
              child: CustomPaint(
                size: Size(300, 300),
//                painter: NStarPainter(starFlag,starType,isBorder),
              painter: StarDemoPainter(),
              ),
            ),
            Row(
              children: [
                FlatButton(
                  child: Text("+ "),
                  onPressed: () {
                    setState(() {
                      starFlag ++;
                    });
                  },
                ),
                Text("$starFlag 角星"),
                FlatButton(
                  child: Text("- "),
                  onPressed: () {
                    setState(() {
                      starFlag --;
                      if(starFlag<3){
                        starFlag=3;
                      }
                    });
                  },
                ),
              ],
            ),
            Wrap(spacing: 12,runSpacing: 12,children: [
              FlatButton(child: Text("五角星"),onPressed: (){
                setState(() {
                  starType =1;
                });
              },),
              FlatButton(child: Text("正五角星"),onPressed: (){
                setState(() {
                  starType =2;
                });
              },),
              FlatButton(child: Text("正多边形"),onPressed: (){
                setState(() {
                  starType =3;
                });
              },),
              FlatButton(child: Text("填充"),onPressed: (){
                setState(() {
                  isBorder=!isBorder;
                });
              },)
            ],)
          ],
        ),
      ),
    );
  }
}

///7 /lib/code21/main_data2132.dart
class StarDemoPainter extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 2.0; //画笔的宽度
  @override
  void paint(Canvas canvas, Size size) {
    Path startPath =
        CanvasPathUtils.nStarPath(
            ///角数
            5,
            ///外接圆半径
            100,
            ///内切圆的半径
            60);

    ///正五角星
    Path startPath2 =
    CanvasPathUtils.regularStarPath(outRadius: 100, startNumber: 5);
    ///绘制
    canvas.drawPath(startPath2, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

///7 /lib/code21/main_data2132.dart
///  XOY二维 坐标轴
class NStarPainter extends CustomPainter {
  int startNumber;
  int startType;
  bool isBorder;

  NStarPainter(this.startNumber,this.startType,this.isBorder);

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 2.0; //画笔的宽度
  @override
  void paint(Canvas canvas, Size size) {
    Path startPath =
        CanvasPathUtils.nStarPath(startNumber, size.width / 2, size.width / 4);

    if(isBorder){
      _paint.style=PaintingStyle.stroke;
    }else{
      _paint.style=PaintingStyle.fill;
    }
    if(startType==2){
      startPath = CanvasPathUtils.regularStarPath(startNumber:startNumber, outRadius:size.width / 2);
    }else if(startType==3){
      startPath = CanvasPathUtils.regularPolygonPath(sliderNumber:startNumber, outRadius:size.width / 2);
    }

    canvas.drawPath(startPath, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
