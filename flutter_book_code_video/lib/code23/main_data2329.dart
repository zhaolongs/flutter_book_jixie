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

///lib/code23/20main_data2329.dart
class TweenSequencePage2 extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/20main_data2329.dart
/// AnimatedWidget 的基本使用
class _TransformPageState extends State<TweenSequencePage2>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;
  Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();

    ///1、创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    ///2、创建串行动画
    _angleAnimation = TweenSequence<double>([
      ///TweenSequenceItem来组合其他的Tween
      ///0.1 是缴
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.1), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 0.1, end: 0), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -0.1), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: -0.1, end: 0), weight: 4),
    ]).animate(_animationController);

    ///----------------------------------------------------------------
    ///添加动画状态监听
    _angleAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ///正向执行完毕后立刻反向执行（倒回去）
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ///反向执行完毕后立刻正向执行
        _animationController.forward();
      }
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
      ///执行旋转，快速的微旋转而形成抖动的动画效果
      body: Column(
        children: [
          ///将执行动画的效果封装到 AnimatedWidget 中
          CustomAnimateWidget(animation: _angleAnimation,),
        ],
      ),
    );
  }
}
///lib/code23/20main_data2329.dart
///定义执行动画的组件
class CustomAnimateWidget extends AnimatedWidget {
  CustomAnimateWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    ///获取对应的Animation
    final Animation<double> animation = listenable;

    ///执行旋转变换
    return Transform(
      transform: Matrix4.rotationZ(animation.value),
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.deepOrange,
      ),
    );
  }
}
