import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2007.dart
///  Transform 图形变换视差效果
class TransformTranslationPage3 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    ///7 /lib/code20/main_data2007.dart
    ///  Transform 图形平移变换
    ///  通过矩阵来来构建变换
    ///  创建一个单位矩阵
    Matrix4 matrix4 =Matrix4.fromList([
      1,0,0,0,
      0,1,0,0,
      0,0,1,0,
      0,0,0,1,
    ]);
//    matrix4=buildEntry(matrix4);
    ///绕x轴方向的变换
//    matrix4=buildYEntry(matrix4);

    ///绕y轴方向的变换
//    matrix4=buildXEntry(matrix4);
    ///缩放
    ///matrix4 =buildScal(matrix4);
    return Scaffold(
      appBar: AppBar(title: Text("图形变换视差效果"),),
      body: Container(child: Stack(
        children: [
          Align(alignment: Alignment.center, child:
          Transform(
            // 配置变换
            transform: matrix4, 
            // 参考中心
            alignment: FractionalOffset.center,
            child: Container(
              width: 250,
              height: 200,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),),
          buildBackMirror(),
        ],
      ),),
    );
  }


  //记录x轴方向的平移像素
  double x = 0.0;
  //记录y轴方向的平移像素
  double y = 0.0;
  //记录z轴方向的平移像素
  double z = 0.0;



  buildEntry(Matrix4 matrix4){
    ///参数三为负数 绕X轴顺时针旋转的视差效果
    ///参数三为正数 绕X轴逆时针旋转的视差效果
    matrix4.setEntry(3, 1, 0.000);
    ///参数三为负数 绕Y轴顺时针旋转的视差效果
    matrix4.setEntry(3, 0, 0.003);
    matrix4.setEntry(3, 3, 1.2);
    return matrix4 ;
  }
  buildYEntry(Matrix4 matrix4){
    ///参数三为负数 绕X轴顺时针旋转的视差效果
    ///参数三为正数 绕X轴逆时针旋转的视差效果
    matrix4.setEntry(3, 1, -0.012);
    return matrix4 ;
  }

  buildXEntry(Matrix4 matrix4){
    ///参数三为负数 绕Y轴顺时针旋转的视差效果
    ///参数三为正数 绕Y轴逆时针旋转的视差效果
    matrix4.setEntry(3, 0, 0.01);
    return matrix4 ;
  }
  //缩放变换
  buildScal(Matrix4 matrix4){
    return matrix4.setEntry(3, 3, 0.6);
  }

  buildSlider(){
    return Padding(padding: EdgeInsets.only(top: 140),
      child: Container(height: 20,
        child: Slider(max: 0.1, min: -0.1, value: x, onChanged: (va) {
          setState(() {
            x = va;
          });
        },),),);
  }
  buildBackMirror() {
    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.4) // Increasing Scale by 60%
      ..setEntry(3, 1, -0.008) //Changing Perspective along Y-Axis
      ..setEntry(3, 0, 0) // Changing Perspective along X Axis
      ..rotateX(1.309);
    return
      Align(alignment: Alignment(0, 0.0), child:
      Transform(
        transform: shadowMatrix,
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          width: 250,
          height: 200,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                spreadRadius: 1.0)
          ]),
        ),
      )
        ,);
  }
}
