import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example819(),
  ));
}

class Example819 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                      Colors.orangeAccent
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = buildPath(size);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

  Path buildPath(Size size) {
    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 3 * 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 3 * 2);
    path.lineTo(size.width, 0);
    return path;
  }

  Path buildPath2(Size size) {
    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height / 3 * 2);

    path.quadraticBezierTo(size.width / 4, size.height / 6 * 5, size.width / 2,
        size.height / 3 * 2);

    path.quadraticBezierTo(
        size.width / 4 * 3, size.height / 2, size.width, size.height / 3 * 2);

    path.lineTo(size.width, 0);
    return path;
  }
}
