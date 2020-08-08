import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2002.dart
///  Transform 图形变换 缩放
class TransformScalePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的缩放比例
  double x = 0;
  //记录y轴方向的缩放比例
  double y = 0;
  //记录z轴方向的缩放比例
  double z = 0;
  //记录当前缩放轴
  //1为绕x轴，2为绕y轴，3为绕z轴
  int tranType =1;

  double scal=1.0;
  ///页面的主体
  buildBody1(){


    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [


        Padding(padding: EdgeInsets.only(top: 42),),

        ///7 /lib/code20/main_data2002.dart
        ///  Transform 图形缩放变换
        Transform.scale(
          ///缩放的角度
          scale: scal,
          ///配制缩放中心
          ///配制 相对于当前子Widget的中心点的偏移量
          ///如这里的子Container的width与height都是200，那么会有
          ///   （-100，-100）为左上角
          ///   （0，0）为中心
          ///   （100，100）为右下角
          origin: Offset(100, 100),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),



        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Slider(value: scal,max:2,min:0,onChanged: (va){
          setState(() {
            scal=va;
            z=va;
            tranType=3;
            print("当前x值 $scal");
          });
        },),
        Text("在缩放 当前缩放比例 ${scal.toStringAsFixed(2)}"),

        ///7 /lib/code20/main_data2002.dart
        ///  Transform 图形缩放变换
        Transform.scale(
          ///缩放的比例
          scale: scal,
          ///配制缩放中心
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
