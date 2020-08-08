import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2012.dart
///  Transform 图形变换视差效果
class TransformTranslationPage5 extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text("图形变换视差效果"),),
      body: Container(child: Stack(
        children: [
          //构建图片
          Align(alignment: Alignment.center, child:
           Container(
              width: 250, height: 200,
              child: Image.asset("assets/images/2.0x/banner1.webp",),
            ), ),
          //构建前阴影
          buildBackMirror(),
        ],
      ),),
    );
  }

  //构建前阴影
  buildBackMirror() {
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
