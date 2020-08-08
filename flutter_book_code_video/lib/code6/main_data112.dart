import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code6/main_data112.dart
///  Container BoxDecoration gradient Sweep 扫描渐变颜色过渡
class ContainerSweepGradientPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  gradient Sweep 扫描渐变颜色过渡
  Widget buildMainBody(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "示例",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder4(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder1(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                buildBorder2(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Sweep 扫描渐变颜色过渡
  Container buildBorder1() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 扫描渐变
        gradient: SweepGradient(
          ///渐变过渡的颜色体系
          colors: [Colors.blue, Colors.yellow, Colors.red],
          ///过渡的开始角度
          startAngle: 0.0,
          ///过渡的结束角度
          endAngle: 1*3.14,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }
  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Sweep 扫描渐变颜色过渡
  Container buildBorder3() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 扫描渐变
        gradient: SweepGradient(
          ///渐变过渡的颜色体系
          colors: [Colors.blue, Colors.yellow, Colors.red],
          ///过渡的开始角度
          startAngle: 0.0,
          ///过渡的结束角度
          endAngle: math.pi * 1,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }
  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Sweep 扫描渐变颜色过渡
  Container buildBorder4() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 扫描渐变
        gradient: SweepGradient(
          ///渐变过渡的颜色体系
          colors: [Colors.blue, Colors.yellow, Colors.red],
          ///过渡的开始角度
          startAngle: 0.0,
          ///过渡的结束角度
          endAngle: math.pi * 1,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, -0.1),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }
  ///6 /lib/code6/main_data112.dart
  ///  Container BoxDecoration  Sweep 扫描渐变颜色过渡
  Container buildBorder2() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // 扫描渐变
          gradient: SweepGradient(

              ///渐变过渡的颜色体系
              colors: [Colors.blue, Colors.yellow, Colors.red],

              ///过渡的开始角度
              startAngle: 0.0,

              ///过渡的结束角度
              endAngle: 2 * 3.14)),
      child: Text("配置渐变颜色"),
    );
  }
}
