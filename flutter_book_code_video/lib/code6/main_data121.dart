import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data121.dart
///  Container Transform Matrix4 4D 动态变换
///  Matrix4 矩阵旋转变换
class ContainerMatrixRoatePage extends StatefulWidget {
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Transform(
          ///矩阵
          transform: Matrix4.fromList(tranListValues),
            ///被矩阵操作的对象图形
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: new BoxDecoration(
                color: Colors.blue,
                // 线性渐变
                gradient: LinearGradient(
                  ///渐变过渡的颜色体系
                  colors: [Colors.blue, Colors.yellow, Colors.red],
                ),
              ),
            ),
          ),

        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: x,max:pi,min:-pi,onChanged: (va){
          setState(() {
            x=va;
            tranType=1;
          });
        },),

        Text("绕x轴旋转 当前弧度 ${x.toStringAsFixed(2)} 旋转角度${(x*360/pi).toStringAsFixed(2)} 度"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: y,max:pi,min:-pi,onChanged: (va){
          setState(() {
            y=va;
            tranType=2;
          });
        },),
        Text("绕y轴旋转 当前弧度 ${y.toStringAsFixed(2)} 旋转角度${(y*360/pi).toStringAsFixed(2)} 度"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: z,max:pi,min:-pi,onChanged: (va){
          setState(() {
            z=va;
            tranType=3;
          });
        },),
        Text("绕x轴旋转 当前弧度 ${z.toStringAsFixed(2)} 旋转角度${(z*360/pi).toStringAsFixed(2)} 度"),


      ],),
    );
  }
}
