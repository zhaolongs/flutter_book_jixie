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
/// https://blog.csdn.net/zl18608543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example608(),
  ));
}

/// 代码清单 6-10 [SlideTransition]
///lib/code/code6/example_608_ScaleTransition.dart
class Example608 extends StatefulWidget {
  @override
  _Example608State createState() => _Example608State();
}

class _Example608State extends State<Example608>
    with SingleTickerProviderStateMixin {
  //动画控制器
  AnimationController _animationController;

  Animation<Offset> _animation;

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


    //通过 animate 方法将Animation与动画控制器AnimationController结合在一起
    _animation = Tween(
      //begin: Offset.zero, end: Offset(1, 0)
      //    以左上角为参考点，相对于左上角坐标 x轴方向向右 平
      //    移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
      begin: Offset(-1, 0),

      //end: Offset.zero, end: Offset(1, 1)
      //    以左上角为参考点，相对于左上角坐标 x轴方向向右
      //    平移执行动画的Widget 的1倍宽度，
      //    y轴方向 向下 平衡执行动画view 的1倍的高度，
      //    也就是向右下角平移
      end: Offset(0, 0),
    ).animate(_animationController);
  }

  /// 代码清单 6-11 [SlideTransition]
  ///lib/code/code6/example_608_ScaleTransition.dart
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
                  //在这里是向左平移 移出的效果
                  _animationController.reverse();
                } else {
                  //通过控制器正向执行动画 值 0.0 -1.0
                  //在这里是向右平移 移进的效果
                  _animationController.forward(from: 0);
                }
              },
            ),
            buildScalContainer()
          ],
        ),
      ),
    );
  }

  //构建平移变换
  Widget buildScalContainer() {
    return SlideTransition(
      //设置平移
      position: _animation,
      //执行缩放变换的子Widget
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
    );
  }
}
