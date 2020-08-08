import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code20/main_data2011.dart
///  Transform 图形变换 平移
class TransformTranslationPage4 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildBody1(context);
  }

  //记录x轴方向的平移像素
  double x = 0.0;

  //记录y轴方向的平移像素
  double y = 0.0;

  //记录z轴方向的平移像素
  double z = 0.0;

  ///页面的主体
  buildBody1(BuildContext context) {
    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 5) // Increasing Scale by 60%
      ..setEntry(3, 1, -0.008) //Changing Perspective along Y-Axis
      ..setEntry(3, 0, - 0.0008) // Changing Perspective along X Axis
      ..rotateX(0.008)
//      ..rotateY(0.699)
      ; //R
    return Scaffold(
      appBar: AppBar(
        title: Text("视差效果"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top:0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                "assets/images/2.0x/highway.webp",
                fit: BoxFit.fill,
                repeat: ImageRepeat.noRepeat,
              ),
            ),

            ///7 /lib/code20/main_data2011.dart
            ///  Transform entry col 行与row矩阵变换
            Align(alignment: Alignment(-0.1,0.5),child: Transform(
              // 通过矩阵创建Matrix4
              transform: shadowMatrix , //
              ///配置对齐
              alignment: Alignment(0.5,0.9),
              child: Container(
                width: 100,
                height: 700,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                       ///过渡的开始位置
                      begin: Alignment(0, 1),
                      ///过渡的结束位置
                      end: Alignment(0, -1),
                      colors: [
                    Colors.grey,
                    Colors.grey[500],
                    Colors.grey[600],
                    Colors.grey[800],
                  ])
                ),
              ),
            ),),

//          Transform(
//            // 通过矩阵创建Matrix4
//              transform: Matrix4.fromList([
//                1,0,0,0,
//                0,1,0,0,
//                0,0,1,0,
//                0,0,0,1,
//              ])
////               ///X轴方向的偏移
//                ..setEntry(3, 0, 0.00)
//                ///Y轴方向的偏移
//                ..setEntry(3, 1, -0.010)
////                ///缩放
//                ..setEntry(3, 3, 0.6)
//                ,//// changed
//              alignment: FractionalOffset.center,
//              child:Container(
//                width: 50,
//                height: 100,
//                color: Colors.grey,
//              ),),),
          ],
        ),
      ),
    );
  }
}
