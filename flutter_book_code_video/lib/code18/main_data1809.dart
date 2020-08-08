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

///lib/code18/main_data1809.dart
///ClipPath的基本使用
class ClipRectBaseUsePage9 extends StatefulWidget {
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

  ///lib/code18/main_data1809.dart
  ///ClipPath的基本使用
  Widget buildCircleAvatar() {
    return ClipPath(
      ///自定义
      clipper: TiangleCustomClipper(),

      ///子Widget
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        color: Colors.grey[300],
        child: buildImage(),
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

///lib/code18/main_data1809.dart
///三角形边缘样式
class TiangleCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    ///绘制直线
    path.lineTo(0, size.height);
    ///绘制三角形的宽度之和
    double curXPos = 0.0;
    ///绘制小三角直线的y坐标
    double curYPos = size.height;
    ///每个小三角形的横向宽度
    double unit = size.width / 30;
    ///绘制所有的小三角形的宽度累加之和
    ///大于绘制宽度后跳出
    while (curXPos < size.width) {
      ///累加 每条直线的点的 x轴点
      curXPos += unit;
      ///对应的y轴的点  一上一下
      if(curYPos==size.height ){
        curYPos = size.height - 30;
      }else{
        curYPos=size.height;
      }
      ///绘制直线
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
