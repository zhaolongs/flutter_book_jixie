import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code6/shape/coupon_shape_border.dart';
import 'package:flutterbookcode/code6/shape/oval_hole_shape_boder.dart';
import 'package:flutterbookcode/code6/shape/simple_shape_boder.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data129.dart
///ConstrainedBox 的基本使用
class CustomShapePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConstrainedBoxState();
  }
}

///lib/code18/main_data129.dart

class _ConstrainedBoxState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("shape 样式"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            _buildCustomShapeBorder3(),
            SizedBox(
              height: 44,
            ),
            _buildCustomShapeBorder(),
            SizedBox(
              height: 44,
            ),
            _buildCustomShapeBorder2()
          ],
        ),
      ),
    );
  }
  ///lib/code18/main_data129.dart
  Material _buildCustomShapeBorder3() {
    return Material(
      ///背景颜色
      color: Colors.orangeAccent,
      ///阴影高度
      elevation: 2,
      ///使用自定义的边框
      shape: couponShapeBorder(),
      ///子Widget内容
      child: Container(
        ///居中
        alignment: Alignment.center,
        ///内边距
        padding: EdgeInsets.all(10),
        ///高度
        height: 90,
        ///文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  ///lib/code18/main_data129.dart
  ///构建手撕优惠券的Shape
  CouponShapeBorder couponShapeBorder() {
    return CouponShapeBorder(
        ///虚线的颜色
        dashColor: Colors.blue,
        ///是否是虚线
        dash: true,
        ///是否绘制直线或者虚线
        useLine: true,
        ///虚线的点数据
        dashCount: 10,
        ///虚线的宽度
        dashWidth: 2.0,
        ///虚线的绘制位置 [0.0,1.0]
        lineRate: 0.75,
        ///上边框与下边框小洞的直径
        topRadius: 14.0,
        ///左右两边加打动的个数
        holeCount: 6);
  }

  ///lib/code18/main_data129.dart
  Material _buildCustomShapeBorder() {
    return Material(
      ///背景颜色
      color: Colors.orangeAccent,
      ///阴影高度
      elevation: 2,
      ///使用自定义的边框
      shape: SimpleShapeBoder(),
      ///子Widget内容
      child: Container(
        ///居中
        alignment: Alignment.center,
        ///内边距
        padding: EdgeInsets.all(10),
        ///高度
        height: 80,
        ///文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
  ///lib/code18/main_data129.dart
  Material _buildCustomShapeBorder2() {
    return Material(
      ///背景颜色
      color: Colors.orangeAccent,
      ///阴影高度
      elevation: 2,
      ///使用自定义的边框
      shape: OvalHoleShapeBoder(),
      ///子Widget内容
      child: Container(
        ///居中
        alignment: Alignment.center,
        ///内边距
        padding: EdgeInsets.all(10),
        ///高度
        height: 80,
        ///文本
        child: Text(
          "自定义shape",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}



