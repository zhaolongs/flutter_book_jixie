import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as v;

///7 /lib/code20/main_data2005.dart
///  Transform 图形变换 平移
class TransformTranslationPage1 extends StatefulWidget {
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

    //数组中的各位置的系数如图7-54中一至
    List<double> tranListValues =[
      1,0,0,0,
      0,1,0,0,
      0,0,1,0,
      x,y,z,1,
    ];



    return Scaffold(
      body: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: [

        Padding(padding: EdgeInsets.only(top: 42),),

        ///7 /lib/code20/main_data2005.dart
        ///  Transform 图形平移变换
        ///  通过translationValues函数来构建平移变换
        Transform(
          ///平移的矩阵变换配置数组
          transform:Matrix4.fromList(tranListValues),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),
        Transform(
          ///平移x,y,z分别配置偏移量
          transform:Matrix4.translationValues(x,y,z),
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

  buildVector3(){
//    import 'package:vector_math/vector_math_64.dart' as v;
    //创建平移向量
    v.Vector3 vector3 =v.Vector3(x, y, z);
    //参考平移向量变换
    Matrix4 matrix4 = Matrix4.translation(vector3);
  }
}
