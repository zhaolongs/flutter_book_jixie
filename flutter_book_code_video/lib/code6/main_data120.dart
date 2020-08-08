import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data119.dart
///  Container Transform Matrix4 4D 动态变换
class ContainerMatrixTranslatePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的平移像素
  double x = 0;
  //记录y轴方向的平移像素
  double y = 0;
  //记录z轴方向的平移像素
  double z = 0;

  ///页面的主体
  buildBody1(){
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,children: [

        Transform(
          ///矩阵
          transform: Matrix4(
            1,0,0,0,
            0,1,0,0,
            0,0,1,0,
            x,y,z,1,
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
        Slider(value: x,max:200,min:-200,onChanged: (va){
            setState(() {
              x=va;
              print("当前x值 $x");
            });
        },),
        Text("在x轴方向平移 当前偏移量 ${x.toStringAsFixed(2)}"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: y,max:200,min:-200,onChanged: (va){
          setState(() {
            y=va;
            print("当前y值 $y");
          });
        },),
        Text("在y轴方向平移 当前偏移量 ${y.toStringAsFixed(2)}"),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: z,max:200,min:-200,onChanged: (va){
          setState(() {
            z=va;
            print("当前x值 $z");
          });
        },),
        Text("在z轴方向平移 当前偏移量 ${z.toStringAsFixed(2)}"),

        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 22),),
        Slider(value: x,max:200,min:-200,onChanged: (va){
          setState(() {
            x=va;
            y=x;
            print("当前x值 $z");
          });
        },),
        Text("对角线 偏移量 ${y.toStringAsFixed(2)}"),


      ],),
    );
  }
}
