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
/// https://study.163.com/instructor/1021406128.htm
/// https://blog.csdn.net/zl18612543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example612(),
  ));
}

/// 代码清单 6-15 [BoxConstraintsTween] 的基本使用
///lib/code/code6/example_612_Tween.dart
class Example612 extends StatefulWidget {
  @override
  _Example612State createState() => _Example612State();
}

class _Example612State extends State<Example612>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;
  Animation<BoxConstraints> _animation;

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
    _animationController.addListener(() {
      setState(() {});
    });
    // 创建一个 Tween，值类型为 BoxConstraints
    _animation = BoxConstraintsTween(
            begin: BoxConstraints(minHeight: 100, maxHeight: 100),
            end: BoxConstraints(minHeight: 50, maxHeight: 50))
        .animate(_animationController);
  }

  //动态修改容器的约束
  Widget buildContainer() {
    return ConstrainedBox(
      constraints: _animation.value,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.blue,
        width: 200,
        height: 10,
      ),
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
                  //反向执行
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画
                  _animationController.forward(from: 0);
                }
              },
            ),
            buildContainer()
          ],
        ),
      ),
    );
  }
}
