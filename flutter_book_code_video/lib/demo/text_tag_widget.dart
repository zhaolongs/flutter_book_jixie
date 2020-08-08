import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/color_utils.dart';


/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/26.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/demo/text_tag_widget.dart
class TextTagWidget extends StatefulWidget {
  ///显示的文本
  String text;
  ///外边距
  EdgeInsets margin;
  ///内边距
  EdgeInsets padding;
  ///文本显示样式
  TextStyle textStyle;
  ///标签背景颜色
  Color backgroundColor;
  ///标签边框颜色
  Color borderColor;
  ///标签边框圆角
  double borderRadius;

  TextTagWidget(this.text,
      {this.margin = const EdgeInsets.all(4),
      this.padding =
          const EdgeInsets.only(left: 6, right: 6, top: 3, bottom: 3),
      this.textStyle,
      this.backgroundColor,
      this.borderColor,
      this.borderRadius = 20.0}) {
    ///定义边框的颜色
    if (this.borderColor == null) {
      ///当边框颜色没有指定时 取用背景颜色
      if (this.backgroundColor != null) {
        this.borderColor = this.backgroundColor;
      } else {
        ///当背景颜色没有指定时 取随机生成颜色
        this.borderColor = getRandomColor();
      }
    }
    ///当没有指定文本样式时
    if (this.textStyle == null) {
      ///默认文本颜色与边框颜色一致
      Color textColor = this.borderColor;
      ///当指定了背景颜色时
      ///使用文本颜色为白色
      if (backgroundColor != null) {
        textColor = Colors.white;
      }
      ///创建使用的文本样式
      this.textStyle = TextStyle(fontSize: 12, color: textColor);
    }
    ///当背景颜色未指定时
    ///设置为透明色
    if (this.backgroundColor == null) {
      this.backgroundColor = Colors.transparent;
    }
  }

  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TextTagWidget> {
  @override
  Widget build(BuildContext context) {
    ///构建边框装饰
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          border: Border.all(color: widget.borderColor)),
      child: buildTextWidget(),
    );
  }

  ///构建文本
  Text buildTextWidget() {
    return Text(
      widget.text,
      style: widget.textStyle,
      textAlign: TextAlign.center,
    );
  }
}
