import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutterbookcode/utils/image_loader_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example818(),
  ));
}

class Example818 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    _animationController.reset();
    _animationController.forward();
    setState(() {
      currentIndex = index;
    });
  }

  AnimationController _animationController;

  Animation<double> _animation;
  Animation<Offset> _slideAnimation;
  Animation<double> _leftSlideAnimation;
  Animation<double> _roateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        vsync: this,
        duration: Duration(milliseconds: 3000));
    _animationController.addListener(() {
      print("_animationController is ${_animationController.value}");

      print("_leftSlideAnimation is ${_leftSlideAnimation.value}");

      setState(() {});
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    _leftSlideAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.0, 0.6, curve: Curves.bounceIn),
        parent: _animationController));

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        curve: Interval(0.65, 1.0, curve: Curves.ease),
        parent: _animationController));

    _slideAnimation = Tween(begin: (Offset(0.0, -1.0)), end: Offset(0.0, -0.2))
        .animate(CurvedAnimation(
            curve: Interval(0.55, 1.0, curve: Curves.bounceInOut),
            parent: _animationController));
    _roateAnimation = Tween(begin: 0.0, end: 4.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut, parent: _animationController));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: CustomBotommPainter(progress: _animation.value),
                  ),
                  Positioned(
                    left: size.width / 2 * _leftSlideAnimation.value - 26,
                    bottom: 20,
                    // curve: Curves.bounceInOut,
                    // duration: Duration(milliseconds: 800),
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: RotationTransition(
                        //设置旋转中心
                        alignment: Alignment.center,
                        //设置旋转的倍率 实际旋转的角度为 这里的值 value * 2 * pi
                        //如 _animationController 的值 是 0.0 -1.0 ,
                        //   旋转的角度就是从 0 到 2 * pi  360 度
                        //   顺时针
                        turns: _roateAnimation,
                        child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                            elevation: 0.1,
                            onPressed: () {}),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: currentIndex == 0
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                          onPressed: () {
                            setBottomBarIndex(0);
                          },
                          splashColor: Colors.white,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.restaurant_menu,
                              color: currentIndex == 1
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            }),
                        Container(
                          width: size.width * 0.20,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: currentIndex == 2
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                        IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: currentIndex == 3
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBotommPainter extends CustomPainter {
  double progress;

  CustomBotommPainter({this.progress = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20 * progress); // Start
    //第一段
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    //第二段
    path.quadraticBezierTo(size.width * 0.35 + size.width * 0.05 * progress, 0,
        size.width * 0.35 + size.width * 0.05 * progress, 20 * progress);
    //第三段
    // path.arcToPoint(Offset(size.width * 0.40+size.width * 0.20*progress, 20*progress), radius: Radius.circular(20.0*progress), clockwise: false);
    path.cubicTo(
        size.width * 0.35 + size.width * 0.05 * progress,
        70 * progress,
        size.width * 0.60,
        70 * progress,
        size.width * 0.65 - size.width * 0.05 * progress,
        20 * progress);
    //第四段
    path.quadraticBezierTo(size.width * 0.65 - size.width * 0.05 * progress, 0,
        size.width * 0.65, 0);
    //第五段
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20 * progress);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
