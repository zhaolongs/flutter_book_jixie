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
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example602(),
  ));
}

/// 代码清单 6-4 动画控制器[AnimationController]
///lib/code/code6/example_602_FadeTransition.dart
class Example602 extends StatefulWidget {
  @override
  _Example602State createState() => _Example602State();
}

class _Example602State extends State<Example602>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = new AnimationController(
      //绑定Ticker
      vsync: this,
      //正向执行 执行时间
      duration: Duration(milliseconds: 3000),
      //反向执行 执行时间
      reverseDuration: Duration(milliseconds: 3000),
      //执行起始值 默认 0.0 需要比 upperBound 小
      lowerBound: 0.0,
      //执行终点值 默认 1.0
      upperBound: 1.0,
    );

    //动画执行过程中的时实回调
    _animationController.addListener(() {});

    //添加动画控制器的动画状态监听
    _animationController.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          //动画从 controller.reverse() 反向执行结束时会回调此方法
          break;
        case AnimationStatus.forward:
          //执行 controller.forward() 会回调此状态

          break;
        case AnimationStatus.reverse:
          //执行 controller.reverse() 会回调此状态

          break;
        case AnimationStatus.completed:
          //动画从 controller.forward() 正向执行结束时会回调此方法
          break;
      }
    });
  }
  /// 代码清单 6-3
  ///lib/code/code6/example_602_FadeTransition.dart
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
              child: Text("正向执行 "),
              onPressed: () {
                //通过控制器正向执行动画 值 0.0 -1.0
                setState(() {
                  _animationController.forward(from: 0);
                });
              },
            ),

            ElevatedButton(
              child: Text("反向执行 "),
              //通过控制器反向执行动画 值 1.0 -0.0
              onPressed: () {
                setState(() {
                  _animationController.reverse();
                });
              },
            ),
            //执行动画的组件
            buildFadeTransition(),
          ],
        ),
      ),
    );
  }

  /// 代码清单 6-2 构建渐变动画[FadeTransition] 基本使用
  ///lib/code/code6/example_602_FadeTransition.dart
  Widget buildFadeTransition() {
    //透明度渐变动画组件
    return FadeTransition(
      //过渡
      opacity: _animationController,
      //将要执行动画的子view
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
