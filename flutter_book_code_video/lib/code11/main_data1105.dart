import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/6.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class WidgetsBindingObserverPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1105.dart
///WidgetsBindingObserver的基本使用
class _TestPageState extends State<WidgetsBindingObserverPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    //添加观察者或者说是绑定监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    //销毁观察者或者说是解绑监听
    WidgetsBinding.instance.removeObserver(this);
  }

  ///生命周期变化时回调
  //  resumed:应用可见并可响应用户操作
  //  inactive:用户可见，但不可响应用户操作
  //  paused:已经暂停了，用户不可见、不可操作
  //  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("@@@@@@@@@  didChangeAppLifecycleState: $state");
  }

  ///显示页面尺寸改变时回调，例如旋转、输入键盘弹出
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance.window.physicalSize;
    print("当前显示页面  ：宽：${size.width} 高：${size.height}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        ///填充布局
        body: Container(
            child: Center(
      child: Text("flutter"),
    )));
  }
}
