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

///lib/code23/main_data2319.dart
class CurvedAnimationPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}
///lib/code23/main_data2319.dart
///CurvedAnimation的基本使用
class _TransformPageState extends State<CurvedAnimationPage>
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
    // 创建一个 非线性的Animation
    //默认情况下是从 0.0 ~ 1.0
    ///震荡弹性曲线动画就完成了，Curves.bounceIn可以看成先放大在缩小，在放大在缩小，在放大在缩小
    _animation=CurvedAnimation(parent: _animationController,curve: Curves.bounceIn)
      ///添加状态监听器
      ..addStatusListener((status){
      //动画在正向执行完毕后的状态
      if(status==AnimationStatus.completed){
        //反向执行
        _animationController.reverse();
      }else if(status==AnimationStatus.dismissed){
        //动画在开始时就停止的状态
        //或者是反向执行结束的状态
        //forward是向前正向执行
        _animationController.forward();
      }
    })
      ///添加动画监听
      ..addListener((){
        ///实时回调
      setState(() {
        print(_animation.value);
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
        height: _animation.value*100,
        width: _animation.value*100,
        child: FlutterLogo(),
      )
    );
  }
}
