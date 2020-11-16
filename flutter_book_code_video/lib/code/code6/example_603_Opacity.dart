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
    home: Example603(),
  ));
}

/// 代码清单 6-5 透明度组件[Opacity]
///lib/code/code6/example_603_Opacity.dart
class Example603 extends StatefulWidget {
  @override
  _Example603State createState() => _Example603State();
}

class _Example603State extends State<Example603>
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

    //添加实时更新
    _animationController.addListener(() {
      setState(() {});
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
              child: Text("正向执行 "),
              onPressed: () {
                //当前动画的执行进度
                double progress = _animationController.value;
                if (progress == 1.0) {
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画 值 0.0 -1.0
                  _animationController.forward(from: 0);
                }
              },
            ),

            //执行动画的组件
            Opacity(
              //过渡
              opacity: _animationController.value,
              //将要执行动画的子view
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
