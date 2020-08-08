import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vector_math/vector_math_64.dart' as v;

///7 /lib/code10/main_data1015.dart
///  Matrix4 矩阵空间旋转示例分析
class TransformTranslationPage8 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  double x=1;
  double y=0;
  double z=0;
  ///7 /lib/code10/main_data1015.dart
  ///  Matrix4 矩阵方法汇总说明
  ///  页面的主体 Matrix4 空间旋转的示例
  buildBody1() {

    ///  用于图1的矩阵 顺时针旋转34度左右
    Matrix4 matrix1 =Matrix4.identity();

    matrix1.rotate(v.Vector3(1,1,1), 0.5);

    Matrix4 matrix2=Matrix4(
      1,-0.36,0.6,0,
      0.6,1,-0.36,0,
      -0.36,0.6,1,0,
      0,0,0,1
    );



    return Scaffold(
      appBar: AppBar(title: Text("图形变换视差效果"),),
      body: Container(color: Colors.grey,child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //构建图片1
          Transform(
            // 配置变换
            transform: matrix1,
            // 参考中心
            alignment: FractionalOffset.center,
            child: Container(
              color: Colors.deepPurple,
              width: 100,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),

          Container(height: 50,),
          Transform(
            // 配置变换
            transform: matrix2,
            // 参考中心
            alignment: FractionalOffset.center,
            child: Container(
              color: Colors.deepPurple,
              width: 100,
              height: 100,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),

          Padding(padding: EdgeInsets.all(10),child: Slider(value: x,max: 1,min: -1,onChanged: (va){
            setState(() {
              x=va;
            });
          },),),

          Padding(padding: EdgeInsets.all(10),child: Slider(value:y,max: 1,min: -1,onChanged: (va){
            setState(() {
              y=va;
            });
          },),),

          Padding(padding: EdgeInsets.all(10),child: Slider(value:z,max: 1,min: -1,onChanged: (va){
            setState(() {
              z=va;
            });
          },),),
        ],
      ),),
    );
  }

}
