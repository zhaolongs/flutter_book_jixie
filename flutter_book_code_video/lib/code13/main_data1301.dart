import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class GestureDetectorUsePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1301.dart
//手势识别GestureDetector的基本使用
class _TestPageState extends State<GestureDetectorUsePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureDetector"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              buildGestureUseWidget(),
              buildInkWellUseWidget(),
              buildCommonImageWidget(),
            ],
          )),
    );
  }

  //lib/code/main_data1301.dart
  ///一个常用的图片
  Widget buildCommonImageWidget() {
    return Row(
      children: [
        Container(
          width: 200,
          height: 100,
          child: Image.asset(
            "assets/images/2.0x/banner1.webp",
          ),
        )
      ],
    );
  }

  //lib/code/main_data1301.dart
  ///手势识别的基本使用
  Widget buildGestureUseWidget() {
    return Row(
      children: [
        GestureDetector(
          ///手指抬起时的回调
          onTap: () {
            print("点击了图片");
          },
          child: Container(
            width: 200,
            height: 100,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
            ),
          ),
        ),
      ],
    );
  }
  //lib/code/main_data1301.dart
  ///InkWell的基本使用
  Widget buildInkWellUseWidget() {
    return Row(
      children: [
        InkWell(
          ///手指抬起时的回调
          onTap: () {
            print("点击了图片");
          },
          child: Container(
            width: 200,
            height: 100,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
            ),
          ),
        ),
      ],
    );
  }
}
