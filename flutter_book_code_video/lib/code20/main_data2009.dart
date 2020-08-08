import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2009.dart
///  Transform skew 倾斜
class TransformSkewPage2 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //skew 倾斜变化比率
  double flag = 0.0;

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform skew 倾斜 "),
      ),
      body: Container(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            ///7 /lib/code20/main_data2009.dart
            ///  Transform 图形变换
            ///  Transform skew 倾斜
            Transform(
                ///Y轴方向的倾斜
                transform: Matrix4.skewY(pi * flag),
                //配置参考中心点
                //当前配置为Container容器的左下角
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 250,
                  height: 125,
                  child: Image.asset(
                    "assets/images/2.0x/banner1.webp",
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Align(
              child: Text("当前 弧度${(pi * flag).toStringAsFixed(2)}"),
              alignment: Alignment(0, 0.3),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            ///7 /lib/code20/main_data2009.dart
            ///  Transform skew 倾斜 Slider 控制倾斜角度
            Container(
              height: 20,
              ///滑动条
              child: Slider(
                ///最大值
                max: 1,
                ///最小值
                min: -1,
                ///当前值
                value: flag,
                ///滑动改变时
                onChanged: (va) {
                  ///更新
                  setState(() {
                    flag = va;
                    // pi指的是圆率π，一个π对应180度
                    double radian = flag*pi;
                    //当前的弧度对应的角度为弧度与每弧度的角度数（约为57.3）的积
                    double angle = radian * (180/pi);
                    print("当前弧度 $radian  当前角度 $angle");
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
