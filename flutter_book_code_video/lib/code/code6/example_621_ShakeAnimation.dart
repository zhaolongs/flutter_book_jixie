import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

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
    home: Example621(),
  ));
}

/// 代码清单 6-23 按钮抖动
///lib/code/code6/example_621_ShakeAnimation.dart
class Example621 extends StatefulWidget {
  @override
  _Example621State createState() => _Example621State();
}

class _Example621State extends State<Example621>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("抖动"),
      ),
      //抖动的动画效果
      body: buildShakeAnimationWidget(),
    );
  }

  //抖动动画控制器
  ShakeAnimationController _shakeController = new ShakeAnimationController();

  //构建抖动效果
  ShakeAnimationWidget buildShakeAnimationWidget() {
    return ShakeAnimationWidget(
      //抖动控制器
      shakeAnimationController: _shakeController,
      //微旋转的抖动
      shakeAnimationType: ShakeAnimationType.LeftRightShake,
      //设置不开启抖动
      isForward: false,
      //默认为 0 无限执行
      shakeCount: 0,
      //抖动的幅度 取值范围为[0,1]
      shakeRange: 1,
      //执行抖动动画的子Widget
      child: RaisedButton(
        child: Text(
          '测试',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          //判断抖动动画是否正在执行
          if (_shakeController.animationRunging) {
            //停止抖动动画
            _shakeController.stop();
          } else {
            //开启抖动动画
            //参数shakeCount 用来配置抖动次数
            //通过 controller start 方法默认为 1
            _shakeController.start(shakeCount: 1);
          }
        },
      ),
    );
  }
}
