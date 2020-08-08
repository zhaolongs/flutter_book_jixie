import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as v;

///7 /lib/code10/main_data2016.dart
///  Matrix4 矩阵组合变换
class TransformTranslationPage9 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///7 /lib/code10/main_data2016.dart
  ///  Matrix4  矩阵变换
  buildBody1() {

    ///  用于图1的矩阵 顺时针旋转34度左右
//    Matrix4 matrix1 =Matrix4.compose(v.Vector3(0,0,0), v.Quaternion(0,0,0,0), v.Vector3(1,1,1));

    ///逆时针旋转0.5弧度 ，角度为 0.5*180/pi=26.88度
    double angle =z;

    ///------------------------------------------------------------
    //绕z轴旋转的效果
    //通过 Matrix4的静态函数rotationZ来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix1 =Matrix4.rotationZ(angle);

    //通过 Matrix4的矩阵数据来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix2=Matrix4(
      cos(angle),sin(angle),0,0,
      -sin(angle),cos(angle),0,0,
      0,0,1,0,
      0,0,0,1
    );

    ///------------------------------------------------------------
    ///绕X轴的旋转效果
    ///
    //通过 Matrix4的静态函数rotationX来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix4 =Matrix4.rotationX(angle);

    //通过 Matrix4的矩阵数据来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix5=Matrix4(
        1,0,0,0,
        0,cos(angle),sin(angle),0,
        0,-sin(angle),cos(angle),0,
        0,0,0,1
    );
    ///------------------------------------------------------------
    ///绕Y轴的旋转效果
    ///
    //通过 Matrix4的静态函数rotationX来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix6 =Matrix4.rotationY(angle);

    //通过 Matrix4的矩阵数据来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix7=Matrix4(
        cos(angle),0,-sin(angle),0,
       0,1,0,0,
        sin(angle),0,cos(angle),0,
        0,0,0,1
    );

    ///------------------------------------------------------------
    ///绕Y轴的旋转效果
    ///
    //通过 Matrix4的静态函数rotationX来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix8 =Matrix4.rotationZ(angle)..rotateY(angle);
    Matrix4 matrix10 =Matrix4.rotationZ(angle);
    //通过 Matrix4的矩阵数据来初始化一个逆时针旋转了0.5弧度的矩阵
    Matrix4 matrix9=Matrix4(
        cos(angle),0,-sin(angle),0,
        0,1,0,0,
        sin(angle),0,cos(angle),0,
        0,0,0,1
    );


    ///构建单位矩阵
    Matrix4 matrix3 = Matrix4.identity();
    ///创建旋转三维空间向量
    v.Vector3 vector3 = new v.Vector3(1.0,1.0,1.0);
    ///参照三维空间向量进行旋转
    matrix3.rotate(vector3, 0.5);

//    matrix1 = Matrix4.identity();
//    matrix2 = Matrix4.identity();
    return Scaffold(
      appBar: AppBar(title: Text("图形变换"),),
      body: Container(color: Colors.grey,padding:EdgeInsets.only(top: 100),child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //构建图片1
          Transform(
            // 配置变换
            transform: matrix8,
            // 参考中心
            alignment: FractionalOffset.topLeft,
            child: Container(
              color: Colors.deepPurple,
              width: 200,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),

          Container(height: 50,),
          //构建图片2
          Transform(
            // 配置变换
            transform: matrix10,
            // 参考中心
            alignment: FractionalOffset.topLeft,
            child: Container(
              color: Colors.deepPurple,
              width: 200,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),

          buildFunction(),
        ],
      ),),
    );
  }

  double x=1;
  double y=0;
  double z=0;

  buildFunction(){
    return Padding(padding: EdgeInsets.all(10),child: Slider(value:z,max: pi*2,min: -pi,onChanged: (va){
      setState(() {
        z=va;
      });
    },),);
  }
}
