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

///lib/code18/main_data1807.dart
///ClipPath的基本使用
class ClipRectBaseUsePage7 extends StatefulWidget {
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

  ///lib/code18/main_data1807.dart
  ///ClipPath的基本使用
  Widget buildCircleAvatar() {
    return ClipPath(
      ///自定义
      clipper: DropUpCustomClipper(),
      ///子Widget
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        color: Colors.grey,
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

///lib/code18/main_data1807.dart
///上推样式的视觉效果
class DropUpCustomClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    ///
    Offset A = Offset(0,size.height);
    ///控制点
    Offset B = Offset( size.width / 2, size.height - 100);
    //目标点
    Offset C = Offset( size.width, size.height);
    ///绘制直线 从起点绘制到A点
    path.lineTo(A.dx, A.dy);
    ///一阶贝赛尔曲线
    path.quadraticBezierTo(
        ///控制点
       B.dx,B.dy,
        ///目标点
        C.dx,C.dy);
    ///绘制直线
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
