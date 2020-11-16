import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406208.htm
/// https://blog.csdn.net/zl1
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example620(),
  ));
}

/// 代码清单 6-21
///lib/code/code6/example_619_CurvedAnimation.dart
class Example620 extends StatefulWidget {
  @override
  _Example620State createState() => _Example620State();
}

class _Example620State extends State<Example620>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  //文本样式动画
  Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    //1、创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //2、创建曲线动画
    Animation _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    //3、创建一个 Tween，
    _animation = TextStyleTween(
      begin: TextStyle(
          color: Colors.blue, fontSize: 14, fontWeight: FontWeight.normal),
      end: TextStyle(
          color: Colors.deepPurple, fontSize: 24, fontWeight: FontWeight.bold),
    ).animate(_curvedAnimation);
    //----------------------------------------------------
    //添加动画状态监听
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //正向执行完毕后立刻反向执行（倒回去）
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //反向执行完毕后立刻正向执行
        _animationController.forward();
      }
    });

    //添加监听
    _animation.addListener(() {
      setState(() {
        print('${_animationController.value}-${_animation.value}');
      });
    });

    //正向执行
    _animationController.forward();
  }

  @override
  void dispose() {
    //销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween"),
      ),
      body: Container(
        child: Text(
          "这是一行Flutter代码",
          style: _animation.value,
        ),
      ),
    );
  }
}
