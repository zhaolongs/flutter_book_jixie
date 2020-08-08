import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'gesture_zoom_box.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/9.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class GesturScaleAndSpanPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1306.dart
//手势识别  缩放与拖动
class _TestPageState extends State<GesturScaleAndSpanPage>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  ///减速动画
  ///动画控制器
  AnimationController _animationController;

  ///颜色变化取值
  Animation<Offset> _animateOffset;

  @override
  void initState() {
    super.initState();

    ///初始化动画控制器
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    ///添加动画监听
    _animationController.addListener(() {
      print("top: $_top andr left : $_left");
      setState(() {});
    });

    ///Tween结合_animationController，使300毫秒内执行一个从0.0到0.1的变换过程
    _animateOffset = Tween<Offset>(begin: Offset(0, 0), end: Offset.zero)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动与滑动手势"),
      ),
      backgroundColor: Colors.white,

      ///通过修改Container的外边距来实现拖动子Widget移动功能
      body: Center(child:  GestureZoomBox(
        maxScale: 5.0,
        doubleTapScale: 2.0,
        duration: Duration(milliseconds: 200),
        onPressed: () => Navigator.pop(context),
        child: Container(
          width: 160,
          height: 160,
          child: Image.asset(
            "assets/images/2.0x/banner1.webp",
            fit: BoxFit.fill,
          ),
        ),
      ),),
    );
  }
}
