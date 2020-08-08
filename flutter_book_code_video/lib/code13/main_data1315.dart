import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data1315.dart
//手势识别  双击放大、双指缩放、拖动图片 依赖库使用
class RoteAndScaleImagePage3 extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<RoteAndScaleImagePage3> {
  //lib/code/main_data1315.dart
  //手势识别  双击放大、双指缩放、拖动图片 依赖库使用
  @override
  Widget build(BuildContext context) {
    ///A点的坐标
    Offset aOffset = Offset(0,0);
    ///B点的坐标
    Offset bOffset = Offset(100,100);
    ///求AB的距离
    /// distance 实质上是 math.sqrt(dx * dx + dy * dy)
    double abdistance = (bOffset-aOffset).distance;

    return Scaffold(
      appBar: AppBar(
        title: Text("缩放、拖动图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        ///缩放拖动组件
        child: TouchableContainer(
          ///双击放大
          doubleTapStillScale: true,
          scaleChanged: (ScaleChangedModel model){
            print("ScaleChangedModel ${model.toString()}");
          },
          ///需要操作的子组件
          child: Container(
            width: 260,
            height: 260,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
              fit: BoxFit.fill,
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
