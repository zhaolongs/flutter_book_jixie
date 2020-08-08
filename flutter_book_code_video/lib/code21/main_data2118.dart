import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//lib/code20/main_data2118.dart
///   绘制文字
class CanvasTextPage extends StatefulWidget {
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
        title: Text("Canvas 绘制文字"),
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
                foregroundPainter: TextPainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//lib/code20/main_data2118.dart
///  绘制文字
class TextPainter extends CustomPainter {


  @override
  void paint(Canvas canvas, Size size) {
    ///第一步
    /// 新建一个段落建造器，然后将文字基本信息填入;
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle(
      ///文字方向从左向右
      textDirection: TextDirection.ltr,
      ///最大行数
      maxLines: 2,
      ///文本居中
      textAlign: TextAlign.center,
      ///粗体
      fontWeight: FontWeight.w400,
      ///文字样式
      fontStyle: FontStyle.normal,
      ///文本大小
      fontSize: 14.0,
      ///配置超出范围时 文本段落结尾时显示的内容
      ellipsis: "...",
      ///设置行间距 实际的行高为 height*fontSize
      height: 1.2,
      textHeightBehavior: TextHeightBehavior(
          applyHeightToFirstAscent: false,
          applyHeightToLastDescent: true),
    ));

    ///第二步设置文字的样式
    ///这里配置的部分属性如 fontSize会覆盖ParagraphStyle中配置的fontSize
    paragraphBuilder.pushStyle(ui.TextStyle(
        color: Colors.red,
        fontSize: 14,
      fontWeight: FontWeight.w500
    ));
    ///第三步
    String text ="执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天";
    ///绑定要绘制的文本
    paragraphBuilder.addText(text);

    //第四步 设置文本的宽度约束
    // 参数为允许文本绘制的最大宽度
    ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: 100);
    // 这里需要先layout,将宽度约束填入，否则无法绘制
    ui.Paragraph paragraph = paragraphBuilder.build()..layout(pc);

    ///第五步 最后就是绘制
    ///偏移量在这里指的是文字左上角的 位置
    canvas.drawParagraph(paragraph, Offset(10,10));

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }


}
