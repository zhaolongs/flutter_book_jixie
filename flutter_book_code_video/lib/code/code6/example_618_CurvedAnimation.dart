
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
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example618(),
  ));
}

/// 代码清单 6-15
///lib/code/code6/example_618_CurvedAnimation.dart
class Example618 extends StatefulWidget {
  @override
  _Example618State createState() => _Example618State();
}

class _Example618State extends State<Example618>
    with SingleTickerProviderStateMixin {
  //动画控制器
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
    //震荡弹性曲线动画就完成了，Curves.bounceIn可以看成先放大在缩小，在放大在缩小，在放大在缩小
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceIn)
          //添加状态监听器
          ..addStatusListener((status) {
            //动画在正向执行完毕后的状态
            if (status == AnimationStatus.completed) {
              //反向执行
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              //动画在开始时就停止的状态
              //或者是反向执行结束的状态
              //forward是向前正向执行
              _animationController.forward();
            }
          });
    //添加动画监听
    _animationController.addListener(() {
      //实时回调
      setState(() {
        print(_animation.value);
      });
    });
    _animationController.forward(); //正向执行
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
        margin: EdgeInsets.symmetric(vertical: 10.0),
        // 使用 Tween 创建出来的 Animation 的 value
        // 从 0 到 300
        height: _animation.value * 100,
        width: _animation.value * 100,
        child: FlutterLogo(),
      ),
    );
  }
}
