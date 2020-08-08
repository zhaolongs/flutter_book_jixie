import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2005.dart
///  Transform 图形变换 平移
class TransformTranslationPage2 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  //记录x轴方向的平移像素
  double x = 0.0;
  //记录y轴方向的平移像素
  double y = 0.0;
  //记录z轴方向的平移像素
  double z = 0.0;


  ///页面的主体
  buildBody1(){



    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [

        Padding(padding: EdgeInsets.only(top: 42),),

        ///7 /lib/code20/main_data2005.dart
        ///  Transform 图形平移变换
        ///  通过translate函数来构建平移变换
        Transform.translate(
          offset: Offset(x, y),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),


        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在水平方向平移 当前平移像素 ${x.toStringAsFixed(2)}"),
        Slider(value: x,max:200,min:-200,onChanged: (va){
          setState(() {
            x=va;
            print("当前x值 $x");
          });
        },),
        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在竖直方向平移 当前平移像素 ${y.toStringAsFixed(2)}"),
        Slider(value: y,max:200,min:-200,onChanged: (va){
          setState(() {
            y=va;
            print("当前x值 $y");
          });
        },),

        ///---------------------------------------------
        Padding(padding: EdgeInsets.only(top: 42),),
        Text("在综合方向平移 当前平移像素 y:${y.toStringAsFixed(2)}  x:${x.toStringAsFixed(2)}"),
        Slider(value: x,max:200,min:-200,onChanged: (va){
          setState(() {
            x=va;
            y=x/2;
          });
        },),



      ],),),
    );
  }
}
