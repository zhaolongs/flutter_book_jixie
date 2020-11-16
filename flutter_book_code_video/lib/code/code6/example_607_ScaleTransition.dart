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
/// https://blog.csdn.net/zl18607543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example607(),
  ));
}

/// 代码清单 6-9 [ScaleTransition]
///lib/code/code6/example_607_ScaleTransition.dart
class Example607 extends StatefulWidget {
  @override
  _Example607State createState() => _Example607State();
}

class _Example607State extends State<Example607>
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
      duration: Duration(milliseconds: 1000),
    );
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
                  //在这里是缩小的效果
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画 值 0.0 -1.0
                  //在这里是放大的效果
                  _animationController.forward(from: 0);
                }
              },
            ),
            buildScaleTransition()
          ],
        ),
      ),
    );
  }

//构建缩放动画[ScaleTransition]
  Widget buildScaleTransition() {
    //实现的是等比缩放
    return ScaleTransition(
      //配置缩放中心
      alignment: Alignment.center,
      //过渡
      scale: _animationController,
      //将要执行动画的子view
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
