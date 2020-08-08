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

///lib/code23/main_data2326.dart
class TextStyleTweenPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/main_data2326.dart
///TextStyleTween的基本使用
class _TransformPageState extends State<TextStyleTweenPage>
    with SingleTickerProviderStateMixin {

  ///动画控制器
  AnimationController _animationController;
  ///文本样式动画
  Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();
    //  创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    // 创建一个 Tween，边框圆角
    _animation = TextStyleTween(
      begin: TextStyle(
          color: Colors.blue, fontSize: 14, fontWeight: FontWeight.normal),
      end: TextStyle(
          color: Colors.deepPurple, fontSize: 24, fontWeight: FontWeight.bold),
    )
        ///绑定控制器
        .animate(_animationController)
          ///添加动画状态监听
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              ///正向执行完毕后立刻反向执行（倒回去）
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              ///反向执行完毕后立刻正向执行
              _animationController.forward();
            }
          })
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
      appBar: AppBar(
        title: Text("Tween"),
      ),
      body: Container(
       child: Text("这是一行Flutter代码",style: _animation.value,),
      ),
    );
  }
}
