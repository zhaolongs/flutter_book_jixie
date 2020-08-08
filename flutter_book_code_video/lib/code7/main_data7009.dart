
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

//lib/code7/main_data7009.dart
///FloatingActionButton
class FloatingActionButton4Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code7/main_data7009.dart
///heroTag 动画标签heroTag
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("哈哈"),
      ),
      ///右下角的悬浮按钮
      floatingActionButton: FloatingActionButton(
          ///动画过渡标识 需要与第二个页面中连接动画效果的按钮标识一至
          heroTag: "abc",
          child: Icon(Icons.add),
          tooltip: '这是悬浮按钮的tip',
          onPressed: () {
            ///打开第二个页面
            NavigatorUtils.pushPage(context, FloatingActionButton5Page());
          }),
    );
  }
}

//lib/code7/main_data7009.dart
///heroTag 动画标签heroTag
class FloatingActionButton5Page extends StatefulWidget {
  @override
  _PageState2 createState() => _PageState2();
}

class _PageState2 extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text("这里是第二个页面"),
      ),
      ///动画
      floatingActionButtonAnimator: MyAnimation(),
      ///右下角的悬浮按钮
      floatingActionButton: FloatingActionButton(
          heroTag: "abc",
          child: Icon(Icons.add),
          tooltip: '这是悬浮按钮的tip',
          onPressed: () {
            ///关闭页面
            NavigatorUtils.pop(context);
          }),
    );
  }
}
//lib/code7/main_data7009.dart
///heroTag 动画标签heroTag
class MyAnimation extends FloatingActionButtonAnimator {
  double _x, _y;

  @override
  Offset getOffset({Offset begin, Offset end, double progress}) {
    _x = begin.dx + (end.dx - begin.dx) * progress;
    _y = begin.dy + (end.dy - begin.dy) * progress;
    return Offset(_x * 0.5, _y * 0.9);
  }

  @override
  Animation<double> getRotationAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }

  @override
  Animation<double> getScaleAnimation({Animation<double> parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent);
  }
}