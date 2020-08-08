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

///lib/code18/main_data1811.dart
///ClipPath的基本使用
class ClipRectBaseUsePage11 extends StatefulWidget {
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

  ///lib/code18/main_data1811.dart
  ///ClipPath的基本使用
  Widget buildCircleAvatar() {
    return ClipPath(
      ///自定义
      clipper: ArcCustomClipper(),

      ///子Widget
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        color: Colors.grey[300],
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

///lib/code18/main_data1811.dart
///小圆弧边缘样式
class ArcCustomClipper extends CustomClipper<Path> {
  double radius = 15;
  @override
  Path getClip(Size size) {
    Path path = Path();
    ///移动绘制起点 A点
    path.moveTo(radius, 0.0);
    ///绘制弧线 B点
    path.arcToPoint(Offset(0.0, radius),
        clockwise: true, radius: Radius.circular(radius));
    ///绘制直线到 C点
    path.lineTo(0.0, size.height - radius);
    ///绘制弧线到 D点
    path.arcToPoint(Offset(radius, size.height),
        clockwise: true, radius: Radius.circular(radius));
    ///右下角的 圆弧
    ///绘制直线到 E点
    path.lineTo(size.width - radius, size.height);
    ///绘制弧线到 F点
    path.arcToPoint(Offset(size.width, size.height - radius),
        clockwise: true, radius: Radius.circular(radius));

    ///左上角的圆弧
    ///绘制直线到G点
    path.lineTo(size.width, radius);
    ///绘制直线一H点
    path.arcToPoint(Offset(size.width - radius, 0.0),
        clockwise: true, radius: Radius.circular(radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
