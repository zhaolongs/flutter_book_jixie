import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as v;

///7 /lib/code20/main_data2014.dart
///  Matrix4 矩阵方法汇总说明
class TransformTranslationPage7 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }
  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 矩阵方法汇总说明
  ///  页面的主体 Matrix4逆向变换inverted的示例
  buildBody1() {

    ///  用于图1的矩阵 顺时针旋转34度左右
    Matrix4 matrix1 =Matrix4.identity()..rotateZ(0.6);
    ///  用于图2的矩阵
    ///  通过图1的矩阵，逆向方向来创建
    ///  如 matrix1中的旋转方向是顺时针
    ///  那么这里创建的 matrix2的旋转方向就是逆时针
    Matrix4 matrix2 = buildMatrix4Function6(matrix1);

    return Scaffold(
      appBar: AppBar(title: Text("图形变换视差效果"),),
      body: Container(color: Colors.grey,child: Stack(
        children: [
          //构建图片1
          Align(alignment: Alignment(0,0), child:
          Transform(
            // 配置变换
            transform: matrix1,
            // 参考中心
            alignment: FractionalOffset.topLeft,
            child: Container(
              color: Colors.deepPurple,
              width: 200,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),),
          //构建图片2
          Align(alignment: Alignment(00,0.0), child:
          Transform(
            // 配置变换
            transform: matrix2,
            // 参考中心
            alignment: FractionalOffset.topLeft,
            child: Container(
              color: Colors.yellow,
              width: 200,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner2.webp",),
            ),),),
        ],
      ),),
    );
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 构造函数创建Matrix4对象
  Matrix4 buildMatrix4Function1(){
    return Matrix4 (
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1,);
    }
  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 identity()创建Matrix4对象
  Matrix4 buildMatrix4Function2(){
    /*
      这里生成的是一个单位矩阵，与矩阵
      Matrix4 (
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1,)
      效果一至
     */
    return Matrix4.identity();
  }
  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 fromList创建Matrix4对象
  Matrix4 buildMatrix4Function3(){

    List matrix4List =[
      1,0,0,0,
      0,1,0,0,
      0,0,1,0,
      0,0,0,1,
    ];
    return Matrix4.fromList(matrix4List);
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 copy方式创建Matrix4对象
  Matrix4 buildMatrix4Function4(){

    Matrix4 matrix4 =Matrix4(
      1,0,0,0,
      0,1,0,0,
      0,0,1,0,
      0,0,0,1, );
    ///将上述创建的matrix4矩阵变换数据复制到新的Matrix4矩阵中
    return Matrix4.copy(matrix4);
  }
  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 copy方式创建Matrix4对象
  Matrix4 buildMatrix4Function5(){
    /*
      这里配置的参数生成的是一个单位矩阵，与矩阵
      Matrix4 (
        1,0,0,0,
        0,1,0,0,
        0,0,1,0,
        0,0,0,1,)
      效果一至
     */
    return  Matrix4.columns(
        v.Vector4(1.0, 0.0, 0.0, 0.0),
        v.Vector4(0.0, 1.0, 0.0, 0.0),
        v.Vector4(0.0, 0.0, 1.0, 0.0),
        v.Vector4(0.0, 0.0, 0.0, 1.0));
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 inverted 逆向方式创建Matrix4对象
  Matrix4 buildMatrix4Function6(Matrix4 otherMatrix4){
    ///逆向矩阵创建
    return  Matrix4.inverted(otherMatrix4);
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 缩放函数变换
  Matrix4 buildMatrix4Function7(){
    ///使用方式一 直接使用diagonal3Values来配置x、y、z方向上的缩放比例系数
    return Matrix4.diagonal3Values(2.0,1.0,1.0);
    ///方式二是  使用diagonal3 来创建，配置的参数是三维矢量 Vector3
    ///Vector3 三维矢量 两种构造方法，三个参数分别对应 x / y /z 轴方向缩放
    return Matrix4.diagonal3(v.Vector3(2.0, 1.0, 1.0));
    ///或者是通过Vactor3的array方法来初始化多组三维矢量
    // return Matrix4.diagonal3(v.Vector3.array([2.0, 1.0, 1.0]));

  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 平移函数变换
  Matrix4 buildMatrix4Function8(){
    ///使用方式一 直接使用diagonal3Values来配置x、y、z方向上的平移距离像素
    ///水平向右为 x 轴正向，竖直向下为 y 轴正向；
    return Matrix4.translationValues(230.0,100.0,100.0);
    ///方式二是  使用diagonal3 来创建，配置的参数是三维矢量 Vector3
    ///Vector3 三维矢量 两种构造方法，三个参数分别对应 x / y /z 轴方向缩放
    ///return Matrix4.translation(v.Vector3(230.0,100.0,100.0));
    ///或者是通过Vactor3的array方法来初始化多组三维矢量
    // return Matrix4.translation(v.Vector3.array([230.0,100.0,100.0]));
  }
  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4 对象旋转函数变换
  Matrix4 buildMatrix4Function9(Matrix4 matrix4){
    ///绕x轴旋转1弧度
     matrix4.rotateX(1);
    ///绕y轴旋转1弧度
     matrix4.rotateY(1);
    ///绕z轴旋转1弧度
     matrix4.rotateZ(1);
     ///结合3维向量的旋转
     matrix4.rotate(v.Vector3(2.0, 1.0, 1.0), 1);
     return matrix4;
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4静态旋转函数变换
  Matrix4 buildMatrix4Function10(){
    ///绕x轴旋转1弧度 同时构建返回一个Matrix4
    return Matrix4.rotationX(1);
    ///绕y轴旋转1弧度
    return Matrix4.rotationY(1);
    ///绕z轴旋转1弧度
    return Matrix4.rotationY(1);
  }

  ///7 /lib/code20/main_data2014.dart
  ///  Matrix4静态旋转函数变换
  Matrix4 buildMatrix4Function11(){
    ///绕x轴旋转1弧度 同时构建返回一个Matrix4
//    return Matrix4.compose();

  }
}
