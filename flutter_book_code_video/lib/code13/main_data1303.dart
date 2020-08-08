import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class GesturTapPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1303.dart
//手势识别GestureDetector对图片的缩放
class _TestPageState extends State<GesturTapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tap系列属性"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              buildGestureUseWidget(),
            ],
          )),
    );
  }

  //lib/code/main_data1303.dart

  double _width = 200.0;

  ///手势识别的基本使用
  Widget buildGestureUseWidget() {
    return Row(
      children: [
        //lib/code/main_data1303.dart
        //Tap相关事件回调使用分析
        GestureDetector(
          onTapDown: (TapDownDetails details) {
            print("onTapDown手指按下回调");
          },
          onPanUpdate: (DragUpdateDetails details){
            print("onPanUpdate手指移动回调 dx:${details.delta.dx}  dy:${details.delta.dy}");
          },
          onTapUp: (TapUpDetails details) {
            print("onTapUp手指抬起回调");
          },
          onTap: () {
            print("onTap手指抬起后回调");
          },
          onTapCancel: () {
            print("onTapCancel事件取消回调");
          },
          onDoubleTap: (){
            print("双击onDoubleTap回调");
          },
          onLongPress: (){
            print("onLongPress长按事件回调");
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
