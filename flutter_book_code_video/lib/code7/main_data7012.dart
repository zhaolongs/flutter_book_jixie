import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7012.dart
///FloatingActionButton
class FloatingActionButton8Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<FloatingActionButton8Page>{

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
        floatingActionButton: RoteFloatingButton(),
      );
  }
}

//lib/code7/main_data7012.dart
//旋转变换按钮
class RoteFloatingButton extends StatefulWidget {
  @override
  _RoteButtonPageState createState() => _RoteButtonPageState();
}

//lib/code7/main_data7012.dart
/////旋转变换按钮
class _RoteButtonPageState extends State<RoteFloatingButton>
    with SingleTickerProviderStateMixin {
  ///记录是否打开
  bool isOpened = false;
  ///动画控制器
  AnimationController _animationController;
  ///颜色变化取值
  Animation<Color> _animateColor;
  ///图标变化取值
  Animation<double> _animateIcon;
  ///动画执行速率
  Curve _curve = Curves.easeOut;

  @override
  initState() {
    super.initState();
    ///初始化动画控制器
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    ///添加动画监听
    _animationController.addListener(() {
        setState(() {});
      });
    ///Tween结合_animationController，使500毫秒内执行一个从0.0到0.1的变换过程
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    ///结合_animationController 实现一个从Colors.blue到Colors.deepPurple的动画过渡
    _animateColor = ColorTween(begin: Colors.blue, end: Colors.deepPurple,).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.00, 1.00, curve: _curve,),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return floatButton();
  }
  ///构建FloatingActionButton
  Widget floatButton() {
    return FloatingActionButton(
      ///通过_animateColor实现背景颜色的过渡
      backgroundColor: _animateColor.value,
      onPressed: floatClick,
      ///通过AnimatedIcon实现标签的过渡
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }
  ///FloatingActionButton的点击事件，用来控制按钮的动画变换
  floatClick() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }
  ///页面销毁时，销毁动画控制器
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
