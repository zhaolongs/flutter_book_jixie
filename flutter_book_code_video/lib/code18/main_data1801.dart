import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data1801.dart
///ClipRect的基本使用
class ClipRectBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClipRectPageState();
  }
}

class ClipRectPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("ClipRect基本使用"),
      ),
      body: buildColumn(),
    );
  }

  ///构建线性布局
  Widget buildColumn() {
    return Column(
      children: [
        buildClipRect(),
        Container(
          child: buildImage(),
        )
      ],
    );
  }

  ///lib/code18/main_data1801.dart
  ///矩形裁剪
  Widget buildClipRect() {
    return ClipRect(
      child: Container(
        child: buildImage(),
      ),
    );
  }

  ///构建一个图片组件
  Image buildImage() {
    return Image.asset(
      "assets/images/2.0x/banner4.webp",
      fit: BoxFit.fill,
    );
  }
}
