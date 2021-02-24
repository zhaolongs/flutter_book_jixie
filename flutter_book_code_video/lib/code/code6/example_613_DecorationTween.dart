
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
    home: Example613(),
  ));
}

/// 代码清单 6-12 [DecorationTween] 的基本使用
///lib/code/code6/example_613_DecorationTween.dart
class Example613 extends StatefulWidget {
  @override
  _Example613State createState() => _Example613State();
}

class _Example613State extends State<Example613>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;
  Animation<Decoration> _animation;

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

    // 创建一个 Tween，装饰样式的变化
    _animation = DecorationTween(
      begin: BoxDecoration(
        //当然 BoxDecoration中可使用的样式也非常多
        //读者可以灵活应用
        //线性渐变
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.greenAccent, Colors.deepOrange]),
      ),
      end: BoxDecoration(
        //线性渐变
        gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.deepPurple, Colors.blue]),
      ),
    ).animate(_animationController);
  }

  //动态修改容器的装饰样式
  Widget buildContainer() {
    return Container(
      decoration: _animation.value,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 200,
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
