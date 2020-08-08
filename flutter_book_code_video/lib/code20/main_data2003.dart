import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2003.dart
///  Transform 图形变换 缩放
class TransformScalePage2 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的缩放比例
  double x = 1.0;
  //记录y轴方向的缩放比例
  double y = 1.0;
  //记录z轴方向的缩放比例
  double z = 1.0;
  //记录当前缩放轴

  ///页面的主体
  buildBody1(){

    //数组中的各位置的系数如图7-54中一至
    List<double> tranListValues =[
      x,0,0,0,
      0,y,0,0,
      0,0,z,0,
      0,0,0,1,
    ];

    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [


        Padding(padding: EdgeInsets.only(top: 42),),

        ///7 /lib/code20/main_data2003.dart
        ///  Transform 图形缩放变换
        Transform(
          ///缩放的比例
          transform:Matrix4.fromList(tranListValues),
          ///配制缩放中心 相对于当前子Widget的左上角
          ///如这里的子Container的width与height都是200，那么会有旋转中心
          ///   （0，0）为左上角
          ///   （100，100）为中心
          ///   （200，200）为右下角
          origin: Offset(100, 100),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),



        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在水平方向缩放 当前缩放比例 ${x.toStringAsFixed(2)}"),
        Slider(value: x,max:2,min:0,onChanged: (va){
          setState(() {
            x=va;
            print("当前x值 $x");
          });
        },),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在竖直方向缩放 当前缩放比例 ${y.toStringAsFixed(2)}"),
        Slider(value: y,max:2,min:0,onChanged: (va){
          setState(() {
            y=va;
            print("当前x值 $y");
          });
        },),

        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在综合方向缩放 当前缩放比例 y:${y.toStringAsFixed(2)}  x:${x.toStringAsFixed(2)}"),
        Slider(value: x,max:2,min:0,onChanged: (va){
          setState(() {
            x=va;
            y=x/2;
          });
        },),



      ],),),
    );
  }
}
