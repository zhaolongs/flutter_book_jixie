import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data116.dart
///  Container Transform Matrix4 4D 动态变换
class ContainerTransformPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的旋转弧度
  double x = 0;
  //记录y轴方向的旋转弧度
  double y = 0;
  //记录z轴方向的旋转弧度
  double z = 0;
  ///页面的
  buildBody1(){
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Transform(
          ///这里是配置的旋转功能
          transform: Matrix4(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            0,0,0,1,
          )..rotateX(x)..rotateY(y)..rotateZ(z)..setEntry(3, 2, 0.005),
          ///这里是配置的旋转的参考中心点
          alignment: FractionalOffset.center,
          ///手势识别实现滑动图形，也可以动态变换图形
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = y - details.delta.dx / 100;
                x = x + details.delta.dy / 100;
                print("当前 x:$x  y:$y");
              });
            },
            ///被矩阵操作的对象图形
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: new BoxDecoration(
                color: Colors.blue,
                // 环形渐变
                gradient: LinearGradient(
                  ///渐变过渡的颜色体系
                  colors: [Colors.blue, Colors.yellow, Colors.red],
                ),
              ),
            ),
          ),

        ),
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: x,max:pi,min:-pi,onChanged: (va){
            setState(() {
              x=va;
              print("当前x值 $x");
            });
        },),
        Text("绕x轴旋转 当前弧度 ${x.toStringAsFixed(2)} 旋转角度${(x*360/pi).toStringAsFixed(2)} 度"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: y,max:pi,min:-pi,onChanged: (va){
          setState(() {
            y=va;
            print("当前y值 $y");
          });
        },),
        Text("绕y轴旋转 当前弧度 ${y.toStringAsFixed(2)} 旋转角度${(y*360/pi).toStringAsFixed(2)} 度"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: z,max:pi,min:-pi,onChanged: (va){
          setState(() {
            z=va;
            print("当前x值 $z");
          });
        },),
        Text("绕x轴旋转 当前弧度 ${z.toStringAsFixed(2)} 旋转角度${(z*360/pi).toStringAsFixed(2)} 度"),
      ],),
    );
  }
}
