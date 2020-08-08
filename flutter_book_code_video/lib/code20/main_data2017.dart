import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

///7 /lib/code10/main_data2017.dart
///  Matrix4 矩阵组合变换
class TransformTranslationPage10 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///7 /lib/code10/main_data2017.dart
  ///  Matrix4  矩阵变换
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("图形变换"),
      ),
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //构建图片2
            Transform(
              // 配置变换
              transform: Matrix4Transform()
                  .rotateDegrees(z*57, origin: Offset(0, 0))
                  .matrix4,
              child: Container(
                color: Colors.deepPurple,
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                ),
              ),
            ),
            //构建图片1
            Transform(
              // 配置变换
              transform: Matrix4Transform()
                  .rotate(z, origin: Offset(0, 0))
                  .matrix4,
              child: Container(
                color: Colors.deepPurple,
                width: 200,
                height: 200,
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                ),
              ),
            ),

            buildFunction(),
          ],
        ),
      ),
    );
  }

  double x = 1;
  double y = 0;
  double z = 0;

  buildFunction() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Slider(
        value: z,
        max: pi * 2,
        min: -pi,
        onChanged: (va) {
          setState(() {
            z = va;
          });
        },
      ),
    );
  }
}
