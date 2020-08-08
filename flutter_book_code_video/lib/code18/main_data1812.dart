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

///lib/code18/main_data1812.dart
///ClipPath的基本使用
class ClipRectBaseUsePage12 extends StatefulWidget {
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

  int pageIndex = 0;

  ///构建层叠布局
  Widget buildColumn() {
    ///内边距
    return Padding(
      padding: EdgeInsets.all(12),

      ///层叠布局
      child: Stack(
        children: [
          ///蓝色的背景
          buildBackGround(),

          ///裁剪的样式
          buildCircleAvatar(),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(child: Text('三角样式'),onPressed: (){
                  setState(() {
                    pageIndex=0;
                  });
                },),
                RaisedButton(child: Text('向上凸起的圆弧'),onPressed: (){
                  setState(() {
                    pageIndex=1;
                  });
                },),
                RaisedButton(child: Text('波浪样式'),onPressed: (){
                  setState(() {
                    pageIndex=2;
                  });
                },),
                RaisedButton(child: Text('顶部小圆点效果'),onPressed: (){
                  setState(() {
                    pageIndex=3;
                  });
                },),
              ],
            ),
        ],
      ),
    );
  }

  ///lib/code18/main_data1812.dart
  ///蓝色的背景
  Widget buildBackGround() {
    return Container(
      height: 180,
      ///内边距
      padding: EdgeInsets.all(8),

      ///小圆角边框
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        ///子Widget的底部对齐
        mainAxisAlignment: MainAxisAlignment.end,
        ///包裹
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "早起的年轻人",
                style: TextStyle(fontSize: 18, color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "严于律己，精于行动，点滴积累，着眼未来，你也许不负青春",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///lib/code18/main_data1812.dart
  ///ClipPath的基本使用
  Widget buildCircleAvatar() {
    return Padding(
      padding: EdgeInsets.only(top: 1, left: 1, right: 1),
      child: ClipPath(
        ///自定义
        clipper: buildCustomClipper(),

        ///子Widget
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          color: Colors.grey[300],
          child: buildImage(),
        ),
      ),
    );
  }

  CustomClipper buildCustomClipper(){
    if(pageIndex==0){
      return ArcCustomClipper();
    }else if(pageIndex==1){
      return ArcToUpCustomClipper();
    }else if(pageIndex==2){
      return WaveToUpCustomClipper();
    }else{
      return MulArcCustomClipper();
    }
  }
  ///构建一个图片组件
  Image buildImage() {
    return Image.asset(
      "assets/images/2.0x/banner3.webp",
      fit: BoxFit.fill,
    );
  }
}

///lib/code18/main_data1812.dart
/// 顶尖在下的三角形
class ArcCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    ///直线
    path.lineTo(size.width / 2, size.height);

    ///直线
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}


///lib/code18/main_data1812.dart
/// 向上凸起的圆弧
class ArcToUpCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    ///从起点（0，0）绘制直线到 A 点
    path.lineTo(0, size.height);
    ///绘制贝赛尔曲线
    path.quadraticBezierTo(
      ///控制点 B
        size.width / 2, size.height - 100,
        ///目标点 C
        size.width, size.height);
    ///绘制直线 D 点
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

///lib/code18/main_data1812.dart
/// 波浪圆弧
class WaveToUpCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    ///绘制直线到到 A
    path.lineTo(0, size.height);
    ///绘制第一段绘制贝赛尔曲线
    path.quadraticBezierTo(
        ///控制点
        size.width/4, size.height - 40,
        ///目标点
        size.width/2, size.height-20);
    ///绘制第二段绘制贝赛尔曲线
    path.quadraticBezierTo(
        ///控制点
        3/4*size.width, size.height,
        ///目标点
        size.width, size.height-30);
    ///绘制到 B点
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
///lib/code18/main_data1812.dart
/// 顶部小圆弧
class MulArcCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    ///每个小圆弧起点的x轴坐标
    var uni = size.width / 20;
    ///累加
    while (curXPos < size.width) {
      curXPos += uni;
      ///绘制圆弧
      ///从当前的点绘制到目标点
      path.arcToPoint(
          ///目标点
          Offset(curXPos, size.height),
          ///半径
          radius: Radius.circular(5));
    }
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
