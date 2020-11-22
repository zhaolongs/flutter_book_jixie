import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutterbookcode/utils/image_loader_utils.dart';

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
