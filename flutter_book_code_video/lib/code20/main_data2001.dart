import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data124.dart
///  Transform 图形变换
class TransformBaseUsePage extends StatefulWidget {
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
  //记录当前旋转轴
  //1为绕x轴，2为绕y轴，3为绕z轴
  int tranType =1;

  double roatx=1.0;
  ///页面的主体
  buildBody1(){

    //数组中的各位置的系数如图7-54中一至
    List<double> tranListValues =[
      1,0,0,0,
      0,1,0,0,
      0,0,1,0,
      0,0,0,1,
    ];
    if(tranType==1){
      //更新绕x轴旋转的矩阵系数计算
      tranListValues[5]=cos(x);
      tranListValues[6]=sin(x);
      tranListValues[9]=-sin(x);
      tranListValues[10]=cos(x);
    }else  if(tranType==2){
      //更新绕y轴旋转的矩阵系数计算
      tranListValues[0]=cos(y);
      tranListValues[2]=-sin(y);
      tranListValues[8]=sin(y);
      tranListValues[10]=cos(y);
    }else if(tranType==3){
      //更新绕z轴旋转的矩阵系数计算
      tranListValues[0]=cos(z);
      tranListValues[1]=sin(z);
      tranListValues[4]=-sin(z);
      tranListValues[5]=cos(z);
    }

    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [


        Padding(padding: EdgeInsets.only(top: 42),),
        ///7 /lib/code20/main_data124.dart
        ///  Transform 图形旋转变换
        ///  通过矩阵数组来控制变换
        Transform(
          /// 通过矩阵数组来控制变换
//          transform: Matrix4Transform().rotateDegrees(z*pi*57, origin: Offset(100,100)).matrix4,
          transform: Matrix4.fromList(tranListValues),
          ///配制旋转中心 相对于当前子Widget的左上角
          ///如这里的子Container的width与height都是200，那么会有旋转中心
          ///   （0，0）为左上角
          ///   （100，100）为中心
          ///   （200，200）为右下角
//          origin: Offset(100, 100),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.deepPurple,
          ),
        ),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Slider(value: roatx,max:pi,min:-pi,onChanged: (va){
          setState(() {
            roatx=va;
            z=va;
            tranType=3;
            print("当前x值 $roatx");
          });
        },),
        Text("在旋转 当前弧度 ${roatx.toStringAsFixed(2)} 旋转角度${(roatx*360/pi).toStringAsFixed(2)} 度"),

        ///---------------------------------------------

        Padding(padding: EdgeInsets.only(top: 42),),
        ///7 /lib/code20/main_data124.dart
        ///  Transform 图形旋转变换
        ///  通过构造函数来配置旋转中心
        Transform(
          /// roatx为旋转的弧度 0-pi为180度半圈
          /// Matrix4.rotationZ(roatx) 绕z轴旋转
          /// Matrix4.rotationX(roatx) 绕x轴旋转
          /// Matrix4.rotationZ(roatx) 绕y轴旋转
          transform: Matrix4.rotationZ(roatx),
          ///配制旋转中心 相对于当前子Widget的左上角
          ///如这里的子Container的width与height都是200，那么会有旋转中心
          ///   （0，0）为左上角
          ///   （100，100）为中心
          ///   （200，200）为右下角
          origin: Offset(100, 100),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.deepPurple,
          ),
        ),

        Padding(padding: EdgeInsets.only(top: 42),),
        ///7 /lib/code20/main_data124.dart
        ///  Transform 图形旋转变换
        ///  通过origin来配置旋转中心
        Transform.rotate(
          ///旋转的角度
          angle: roatx,
          ///配制旋转中心 相对于原点（0，0）的偏移量
          ///如这里的子Container的width与height都是200，那么会有
          ///   （-100，-100）为左上角
          ///   （0，0）为中心
          ///   （100，100）为右下角
          origin: Offset(-100, -100),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.deepPurple,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 42),),
        ///7 /lib/code20/main_data124.dart
        ///  Transform 图形旋转变换
        Transform.rotate(
          ///旋转的角度
          angle: roatx,
          ///配制旋转中心
          ///   （-1，-1）为左上角
          ///   （0，0）为中心
          ///   （1，1）为右下角
          alignment: Alignment(-1,-1),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),


      ],),),
    );
  }



}
