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
/// https://blog.csdn.net/zl18609543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example609(),
  ));
}

/// 代码清单 6-12 [RotationTransition] 旋转动画
///lib/code/code6/example_609_RotationTransition.dart
class Example609 extends StatefulWidget {
  @override
  _Example609State createState() => _Example609State();
}

class _Example609State extends State<Example609>
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
                  //在这里是逆时针旋转 360度
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画 值 0.0 -1.0
                  //在这里是 顺时针旋转 360度
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

  //构建旋转变换
  Widget buildRotationTransition() {
    return RotationTransition(
      //设置旋转中心
      alignment: Alignment.center,
      //设置旋转的倍率 实际旋转的角度为 这里的值 value * 2 * pi
      //如 _animationController 的值 是 0.0 -1.0 ,
      //   旋转的角度就是从 0 到 2 * pi  360 度
      //   顺时针
      turns: _animationController,
      //执行缩放变换的子Widget
      child: Container(
        height: 100,
        width: 300,
        color: Colors.blue,
      ),
    );
  }
}
