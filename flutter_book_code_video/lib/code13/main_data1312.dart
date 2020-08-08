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

//lib/code/main_data1312.dart
//手势识别  双指旋转图片
class RoteImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<RoteImagePage> {
  ///旋转弧度
  double _rotation = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("双指旋转图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          ///缩放更新
          onScaleUpdate: (ScaleUpdateDetails details) {
            ///获取旋转的角度
            ///正值为顺时针旋转
            ///负值为逆时针旋转
            double rotation =details.rotation;
            print("onScaleUpdate rotation $rotation");
            setState(() {
              _rotation=rotation;
            });
          },
          child: Container(
              width: 260,
              height: 260,
              child: Transform(
                transform: Matrix4.identity()..rotateZ(_rotation),
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                  fit: BoxFit.fill,
                ),
                alignment: Alignment.center,
              )),
        ),
      ),
    );
  }
}
