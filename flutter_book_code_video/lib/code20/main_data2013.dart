import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2013.dart
///  Transform 图形变换视差效果
class TransformTranslationPage6 extends StatefulWidget {
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

    ///  创建一个单位矩阵
    Matrix4 matrix4 =Matrix4.identity();
    matrix4.setEntry(3, 0, 0.008);
    return Scaffold(
      appBar: AppBar(title: Text("图形变换视差效果"),),
      body: Container(child: Stack(
        children: [
          //构建图片
          Align(alignment: Alignment(0.5,0), child:
          Transform(
            // 配置变换
            transform: matrix4,
            // 参考中心
            alignment: FractionalOffset.center,
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ),),),
          //构建前阴影
          buildBackMirror(),
        ],
      ),),
    );
  }
  //构建前阴影
  buildBackMirror() {
    final Matrix4 shadowMatrix = Matrix4.skewX(1.18)..rotateY(-0.8);
    return
      Align(alignment: Alignment(-1, 0.4), child:
      Transform(
        transform: shadowMatrix,
        alignment: FractionalOffset.topLeft,
        child: Container(
          width: 360,
          height: 100,
          color: Colors.black12,
//          //阴影配置
//          decoration: BoxDecoration(boxShadow: [
//            BoxShadow(
//                color: Colors.black12,
//                blurRadius: 12.0,
//                spreadRadius: 2.0)
//          ]),
        ),
      )
        ,);
  }

  //构建前阴影
  buildBackMirror1() {
    final Matrix4 shadowMatrix = Matrix4.identity()
      //缩放0.7左右
      ..setEntry(3, 3, 0.7)
      //绕X轴变换
      ..setEntry(3, 1, -0.008)
      ..rotateX(1.209);
    return
      Align(alignment: Alignment(0, 0.0), child:
      Transform(
        transform: shadowMatrix,
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          width: 250,
          height: 200,
          //阴影配置
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 12.0,
                spreadRadius: 2.0)
          ]),
        ),
      )
        ,);
  }
}
