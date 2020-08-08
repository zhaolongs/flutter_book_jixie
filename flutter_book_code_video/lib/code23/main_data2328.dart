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

///lib/code23/main_data2328.dart
class TweenSequencePage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/main_data2328.dart
/// TweenSequence 的基本使用
class _TransformPageState extends State<TweenSequencePage>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;

  ///文本样式动画
  Animation<double> _animation;
  Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();

    ///1、创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    ///2、创建串行动画
    ///使用TweenSequence进行多组补间动画
    _animation = TweenSequence<double>([
      ///TweenSequenceItem来组合其他的Tween
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 20), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 20, end: 0), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -20), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: -20, end: 0), weight: 4),
    ]).animate(_animationController);

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
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ///正向执行完毕后立刻反向执行（倒回去）
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        ///反向执行完毕后立刻正向执行
        _animationController.forward();
      }
    });

    ///添加监听
    _animation.addListener(() {
      setState(() {
        print('${_animationController.value}-${_animation.value}');
      });
    });

    ///正向执行
    _animationController.forward();
  }

  ///lib/code23/main_data2328.dart
  void test() {
    ///定义动画曲线
    Animation<double> _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0));

    ///绑定动画曲线
    Animation<double> _sizeAnimation =
        Tween(begin: 100.0, end: 300.0).animate(_curvedAnimation);
  }

  ///lib/code23/main_data2328.dart
  void test2() {
    Animation<double> _animation = TweenSequence([
      ///由 100 过渡到 200的动画曲线
      TweenSequenceItem(
          tween: Tween(begin: 100.0, end: 200.0).chain(
            CurveTween(curve: Curves.easeIn),
          ),
          weight: 1),
      ///组全常量值动画
      TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 2),
      ///由 200 过渡到 300 的线性执行
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 4),
    ]).animate(_animationController);
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

      ///执行平移，快速的左右平移而形成左右抖动的动画效果
      body: Column(
        children: [
          Transform.translate(
            offset: Offset(_animation.value, 0),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Transform.rotate(
            angle: _angleAnimation.value,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
