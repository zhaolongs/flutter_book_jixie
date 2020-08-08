import 'dart:ui' as ui; //这里用as取个别名，有库名冲突

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///5.2 /lib/code3/main_data69.dart
/// 文本显示组件Text
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }

  ///5.2 /lib/code3/main_data69.dart
  /// 文本显示组件Text
  Widget buildBodyFunction() {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
              "这是一个标题"
          ),),
        body: CustomPaint(

          ///这是CustomPainter类的一个实例，它在画布上绘制绘画的第一层
            painter: CustomTextPainter("A fight 早上好")));
  }

}

class CustomTextPainter extends CustomPainter {
  //需要绘制的文字
  String message;

  CustomTextPainter(this.message);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = new Paint();
    paint.color=Colors.grey;
    paint.style=PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTRB(100, 100, 300, 300), paint);

    drawTextFunction(200, Offset(100, 100), canvas, message);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  ///[textWidth] 文本的宽度
  ///[textOffset] 文本绘制的开始位置 左上角
  ///[text] 绘制的文字内容
  void drawTextFunction(double textWidth, Offset textOffset, Canvas canvas,
      String text,
      {Color textColor = Colors.blue, double textSize = 38}) {
    ///创建画笔
    var textPaint = Paint();

    ///设置画笔颜色
    textPaint.color = textColor;

    /// 新建一个段落建造器，然后将文字基本信息填入;
    ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
      textAlign: TextAlign.center,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: textSize,
    ));

    ///设置文字的样式
    pb.pushStyle(ui.TextStyle(color: textColor,textBaseline: TextBaseline.ideographic));

    if (text == null || text.length == 0) {
      text = "--";
    } else if (text.length > 20) {
      text = text.substring(0, 20);
      text += "...";
    }
    pb.addText(text);
    // 设置文本的宽度约束
    ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: textWidth);
    // 这里需要先layout,将宽度约束填入，否则无法绘制
    ui.Paragraph paragraph = pb.build()
      ..layout(pc);

    ///偏移量在这里指的是文字左上角的 位置
    canvas.drawParagraph(paragraph, textOffset);
  }


}