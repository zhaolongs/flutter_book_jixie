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

///lib/code18/main_data1808.dart
///ClipPath的基本使用
class ClipRectBaseUsePage8 extends StatefulWidget {
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
        title: Text("ClipPath的基本使用"),
      ),
      backgroundColor: Colors.white,

      ///构建内容主体
      body: buildColumn(),
    );
  }

  ///构建线性布局
  Widget buildColumn() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Stack(
        children: [
          buildCircleAvatar(),
        ],
      ),
    );
  }

  ///lib/code18/main_data1808.dart
  ///ClipPath的基本使用
  Widget buildCircleAvatar() {
    return ClipPath(
      ///自定义
      clipper: WaveCustomClipper(),

      ///子Widget
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        color: Colors.grey,
//        child: buildImage(),
      ),
    );
  }

  ///构建一个图片组件
  Image buildImage() {
    return Image.asset(
      "assets/images/2.0x/banner3.webp",
      fit: BoxFit.fill,
    );
  }
}

///lib/code18/main_data1808.dart
///波浪样式
class WaveCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    ///绘制直线
    path.lineTo(0, size.height);
    ///绘制第一段向上凹陷的一阶贝赛尔曲线
    path.quadraticBezierTo(
        ///控制点A
        size.width / 4, size.height - 40,
        ///目标点B
        size.width / 2, size.height - 20);
    ///绘制第二段向下凹陷的一阶贝赛尔曲线
    path.quadraticBezierTo(
      ///控制点 C
        3 / 4 * size.width, size.height,
        ///目标点 D
        size.width, size.height - 30);
    ///绘制直线
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
