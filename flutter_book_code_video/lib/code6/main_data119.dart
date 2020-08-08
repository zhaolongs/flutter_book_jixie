import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data119.dart
///  Container Transform Matrix4 4D 动态变换
class ContainerMatrixScalePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的缩放系数
  double x = 1;
  //记录y轴方向的缩放系数
  double y = 1;
  //记录z轴方向的缩放系数
  double z = 1;

  double ratio=1;
  ///页面的
  buildBody1(){
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Transform(
          ///矩阵
          transform: Matrix4(
            x,0,0,0,
            0,y,0,0,
            0,0,z,0,
            0,0,0,ratio,
          ),
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

        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: x,max:2,min:0,onChanged: (va){
            setState(() {
              x=va;
              print("当前x值 $x");
            });
        },),
        Text("在x轴方向缩放 当前缩放比例 ${x.toStringAsFixed(2)}"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: y,max:2,min:0,onChanged: (va){
          setState(() {
            y=va;
            print("当前y值 $y");
          });
        },),
        Text("在y轴方向缩放 当前缩放比例 ${y.toStringAsFixed(2)}"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: z,max:2,min:0,onChanged: (va){
          setState(() {
            z=va;
            print("当前x值 $z");
          });
        },),
        Text("在z轴方向缩放 当前缩放比例 ${z.toStringAsFixed(2)}"),

        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: x,max:2,min:0,onChanged: (va){
          setState(() {
            x=va;
            y=x;
            print("当前x值 $z");
          });
        },),
        Text("等比缩放 缩放比例 ${y.toStringAsFixed(2)}"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: ratio,max:2,min:0,onChanged: (va){
          setState(() {
            ratio=va;
            print("当前x值 $z");
          });
        },),
        Text("等比缩放 缩放比例 ${ratio.toStringAsFixed(2)}"),
      ],),
    );
  }
}
