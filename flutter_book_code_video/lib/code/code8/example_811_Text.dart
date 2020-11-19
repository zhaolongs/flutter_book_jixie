import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    home: Example811(),
  ));
}

class Example811 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //创建画板
        child: CustomPaint(
          //指定画布大小
          size: Size(400, 150),
          painter: TextPainter(),
        ),
      ),
    );
  }
}

/// 代码清单 8-17 绘制文本段落
/// lib/code/code8/example_811_Text.dart
class TextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //第一步
    // 新建一个段落建造器，然后将文字基本信息填入;
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        //文字方向从左向右
        textDirection: TextDirection.ltr,
        //最大行数
        maxLines: 2,
        //文本居中
        textAlign: TextAlign.center,
        //粗体
        fontWeight: FontWeight.w400,
        //文字样式
        fontStyle: FontStyle.normal,
        //文本大小
        fontSize: 24.0,
        //配置超出范围时 文本段落结尾时显示的内容
        ellipsis: "...",
        //设置行间距 实际的行高为 height*fontSize
        height: 1.2,
        textHeightBehavior: TextHeightBehavior(
            //是否对段落中第一行的上行应用 TextStyle.height 修饰符
            //默认为true，TextStyle.height 修饰符将应用于第一行的上升。
            // 如果为 false，将使用字体的默认提升，
            // 并且 TextStyle.height 对第一行的提升没有影响。
            applyHeightToFirstAscent: true,

            //是否将 TextStyle.height 修饰符应用于段落中最后一行的下行。
            //默认为 true，则将对最后一行的下行应用 TextStyle.height 修饰符。
            // 当为 false 时，将使用字体的默认下降，
            // 并且 TextStyle.height 对最后一行的下降没有影响。
            applyHeightToLastDescent: true),
      ),
    );

    //第二步设置文字的样式
    //这里配置的部分属性如 fontSize会覆盖ParagraphStyle中配置的fontSize
    paragraphBuilder.pushStyle(ui.TextStyle(
        color: Colors.red,
        fontSize: 20,
        height: 1,
        fontWeight: FontWeight.w500));

    String text = "执剑天涯，从你的点滴积累开始，所及之处，必精益求精，即是折腾每一天";
    //绑定要绘制的文本
    paragraphBuilder.addText(text);
    // 设置文本的宽度约束
    // 参数为允许文本绘制的最大宽度
    ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: 300);

    //第三步
    // 这里需要先layout,将宽度约束填入，否则无法绘制
    ui.Paragraph paragraph = paragraphBuilder.build()..layout(pc);

    //第四步 最后就是绘制
    //偏移量在这里指的是文字左上角的 位置
    canvas.drawParagraph(paragraph, Offset(40, 40));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
