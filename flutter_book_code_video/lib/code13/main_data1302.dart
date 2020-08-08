import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/common/common_view.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class ImageScalePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1302.dart
//手势识别GestureDetector对图片的缩放
class _TestPageState extends State<ImageScalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片的缩放"),
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

  //lib/code/main_data1302.dart

  double _width = 200.0;

  ///手势识别的基本使用
  Widget buildGestureUseWidget() {
    return Row(
      children: [
        GestureDetector(
          ///手指抬起时的回调
          onTap: () {
            print("点击了图片");
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              _width = 200 * details.scale.clamp(0.7, 10.0);
            });
          },
          child: Container(
            width: _width,
            height: 100,
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
