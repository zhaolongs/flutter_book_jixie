
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
///
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example620(),
  ));
}

/// 代码清单 6-22
///lib/code/code6/example_620_TweenSequence.dart
class Example620 extends StatefulWidget {
  @override
  _Example620State createState() => _Example620State();
}

class _Example620State extends State<Example620>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  //文本样式动画
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //1、创建动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    //2、创建串行动画
    //使用TweenSequence进行多组补间动画
    _animation = TweenSequence<double>([
      //TweenSequenceItem来组合其他的Tween
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 20), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 20, end: 0), weight: 2),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -20), weight: 3),
      TweenSequenceItem<double>(tween: Tween(begin: -20, end: 0), weight: 4),
    ]).animate(_animationController);

    //----------------------------------------------------------------
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
      //执行平移，快速的左右平移而形成左右抖动的动画效果
      body: Transform.translate(
        offset: Offset(_animation.value, 0),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
