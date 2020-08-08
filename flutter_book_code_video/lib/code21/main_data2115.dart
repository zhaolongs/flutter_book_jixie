import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code20/main_data2115.dart
///   画布变换
class CanvasSavePage extends StatefulWidget {
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
        title: Text("Canvas 画布变换"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(
                size: Size(200, 100),
//                child: XOYPage(),
                foregroundPainter: RectPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2115.dart
///  画布变换
class RectPainter extends CustomPainter {

  //lib/code20/main_data2115.dart
  /// 画布变换
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blue //画笔颜色
    ..style= PaintingStyle.fill //画笔style为填充
    ..strokeWidth = 4.0; //画笔的宽度


  @override
  void paint(Canvas canvas, Size size) {

    buildSave(canvas,size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  //lib/code20/main_data2115.dart
  /// 未使用saveLayer
  buildSave(Canvas canvas, Size size) {
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 250, 200);
    canvas.save();
    ///裁剪成圆角矩形
    canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
    ///使用纯颜色填充画布
    canvas.drawPaint(new Paint()..color = Colors.red);
    canvas.drawPaint(new Paint()..color = Colors.white);
    ///合并 
    canvas.restore();
  }
  //lib/code20/main_data2115.dart
  /// 使用saveLayer
  buildSave2(Canvas canvas, Size size) {
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 250, 200);
    canvas.save();
    ///裁剪成圆角矩形
    canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));

    ///保存当前图层并新建图层
    canvas.saveLayer(rect, Paint());
    canvas.drawPaint(new Paint()..color = Colors.red);
    canvas.drawPaint(new Paint()..color = Colors.white);

    canvas.restore();
    canvas.restore();
  }

  buildSave3(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
     canvas.save();
     canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
     canvas.drawPaint(new Paint()..color = Colors.red);
     canvas.drawPaint(new Paint()..color = Colors.white);
     canvas.restore();
  }
  buildSave4(Canvas canvas, Size size) {
    canvas.save();
       canvas.clipRRect(new RRect.fromRectXY(Offset.zero & (size / 2.0), 50.0, 50.0));
       canvas.drawPaint(new Paint()..color = Colors.white);
       canvas.restore();
       canvas.save();
       canvas.clipRRect(new RRect.fromRectXY(size.center(Offset.zero) & (size / 2.0), 50.0, 50.0));
       canvas.drawPaint(new Paint()..color = Colors.white);
       canvas.restore();
  }

  //lib/code20/main_data2115.dart
  /// 画布变换之平移、旋转画布
  buildTranslateFunction4(Canvas canvas) {
    ///保存状态
    canvas.save();
    ///平移画布原点到点(40,40)
    canvas.translate(40,40);
    ///旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    ///绘制矩形
    canvas.drawRect(rect, _paint);
    ///合并
    canvas.restore();
    ///绘制圆形
    canvas.drawCircle(Offset(200,200),50, _paint);
  }

  //lib/code20/main_data2115.dart
  /// 画布变换之平移、旋转画布
  buildTranslateFunction3(Canvas canvas) {
    ///平移画布原点到点(40,40)
    canvas.translate(40,40);
    ///旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    ///绘制矩形
    canvas.drawRect(rect, _paint);

    ///绘制圆形
    canvas.drawCircle(Offset(200,200),50, _paint);
  }

  //lib/code20/main_data2115.dart
  /// 默认情况下绘制圆形
  builddrawCircleFunction(Canvas canvas) {
    ///绘制圆形
    canvas.drawCircle(Offset(200,200),50, _paint);
  }
  //lib/code20/main_data2115.dart
  /// 画布变换之平移、旋转画布
  buildTranslateFunction2(Canvas canvas) {
    ///平移画布原点到点(40,40)
    canvas.translate(40,40);
    ///旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    ///绘制矩形
    canvas.drawRect(rect, _paint);
  }

  //lib/code20/main_data2115.dart
  /// 画布变换之平移画布
  buildTranslateFunction(Canvas canvas) {
    ///平移画布原点到点(40,40)
    canvas.translate(40,40);
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(0, 0, 150, 100);
    ///绘制矩形
    canvas.drawRect(rect, _paint);
  }

  buildRotateFunction(Canvas canvas){
    ///旋转画布 1弧度，顺时针旋转了约57.3度
    canvas.rotate(1);
    ///根据以屏幕左上角为坐标系圆点，分别设置上下左右四个方向距离
    ///left,  top,  right, bottom
    Rect rect = Rect.fromLTRB(40, 40, 150, 100);
    ///绘制矩形
    canvas.drawRect(rect, _paint);
  }

}
