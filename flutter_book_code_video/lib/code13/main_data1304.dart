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
class GesturTapMoveImagePage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1304.dart
//手势识别GestureDetector对拖动widget
class _TestPageState extends State<GesturTapMoveImagePage> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("移动图片"),
      ),
      backgroundColor: Colors.white,

      ///通过修改Container的外边距来实现拖动子Widget移动功能
      body: Container(
        margin: EdgeInsets.only(top: _top, left: _left),
        child: Row(
          children: [
            //lib/code/main_data1304.dart
            //Tap相关事件回调使用分析
            GestureDetector(
              ///手指移动时的回调
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  ///dx为手指移动在x轴方向上的偏移量
                  _left = _left + details.delta.dx;

                  ///dy为手指移动在y轴方向上的偏移量
                  _top = _top + details.delta.dy;
                  if (_left <= 0) {
                    _left = 0;
                  }
                  if (_top <= 0) {
                    _top = 0;
                  }
                });
              },
              child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  "assets/images/2.0x/banner1.webp",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
