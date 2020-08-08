import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code23/main_data2318.dart
class TweenPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}
///lib/code23/main_data2318.dart
///Tween的基本使用
class _TransformPageState extends State<TweenPage>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //  创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // 创建一个 Tween，值从 0 到 300
    _animation = Tween(begin: 0.0, end: 300.0)
        ///绑定控制器
        .animate(_animationController)
          ///添加监听
          ..addListener(() {
            setState(() {
              print('${_animationController.value}-${_animation.value}');
            });
          });
    ///正向执行
    _animationController.forward();
  }

  @override
  void dispose() {
    ///销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tween"),),

      body:Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        // 使用 Tween 创建出来的 Animation 的 value
        // 从 0 到 300
        height: _animation.value,
        width: _animation.value,
        child: FlutterLogo(),
      )
    );
  }
}
