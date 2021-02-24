
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
    home: Example610(),
  ));
}


class Example610 extends StatefulWidget {
  @override
  _Example610State createState() => _Example610State();
}
/// 代码清单 6-9 [Tween] 的基本使用
///lib/code/code6/example_610_Tween.dart
class _Example610State extends State<Example610>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = new AnimationController(
      //绑定Ticker
      vsync: this,
      //正向执行 执行时间
      duration: Duration(milliseconds: 3000),
    );

    // 创建一个 Tween，值从 0 到 300
    _animation = Tween(begin: 0.0, end: 300.0)
        //绑定控制器
        .animate(_animationController)
          //添加监听  级联操作符"…"
          ..addListener(() {
            //_animationController.value 值从 0.0 - 1.0
            //_animation.value 的值从 0 - 300
            print('${_animationController.value}-${_animation.value}');
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("基本动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //点击一个按钮
            ElevatedButton(
              child: Text("执行 "),
              onPressed: () {
                //当前动画的执行进度
                double progress = _animationController.value;
                if (progress == 1.0) {
                  //反向执行
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画
                  _animationController.forward(from: 0);
                }
              },
            ),
            buildRotationTransition()
          ],
        ),
      ),
    );
  }

  //动态修改容器的大小
  Widget buildRotationTransition() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      // 使用 Tween 创建出来的 Animation 的 value
      // 从 0 到 300
      height: _animation.value,
      width: _animation.value,
      color: Colors.blue,
    );
  }
}
