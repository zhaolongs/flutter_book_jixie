
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
    home: Example615(),
  ));
}

/// 代码清单 6-14 [BorderRadiusTween] 的基本使用
///lib/code/code6/example_615_BorderRadiusTween.dart
class Example615 extends StatefulWidget {
  @override
  _Example615State createState() => _Example615State();
}

class _Example615State extends State<Example615>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;
  Animation<BorderRadius> _animation;

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
    //添加动画监听
    _animationController.addListener(() {
      setState(() {});
    });

    // 创建一个 Tween，边框圆角
    _animation = _animation = BorderRadiusTween(
            begin: BorderRadius.all(Radius.circular(10)),
            end: BorderRadius.all(Radius.circular(60)))
        .animate(_animationController);
  }

  //动态修改容器的边框圆角
  Widget buildContainer() {
    return Container(
      decoration: BoxDecoration(
          //背景颜色
          color: Colors.deepPurple,
          //边框圆角
          borderRadius: _animation.value),
      width: 100,
      height: 100,
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
