import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code22/main_data2201.dart
///
class WidgetWillAppearPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // 添加观察者监听
    WidgetsBinding.instance.addObserver(this);
  }

  ///WidgetsBindingObserver的监测状态回调函数
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // 应用程序可见，前台
        print('前台');
        break;
      case AppLifecycleState.paused:
        // 应用程序不可见，后台
        print('后台');
        break;

      case AppLifecycleState.inactive:
        ///用户可见，但不可响应用户操作
        break;
      case AppLifecycleState.detached:
        ///应用被挂起，此状态IOS永远不会回调
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    ///注销观察者
    WidgetsBinding.instance.removeObserver(this);
  }

// 应用尺寸改变时回调，目测还没想到，可能视频播放会用
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    Size size = WidgetsBinding.instance.window.physicalSize;
    print("宽：${size.width} 高：${size.height}");
  }

// 屏幕亮度发生变化的回调
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    print("亮度发生了变化了");
  }

// 内存回调
  @override
  void didHaveMemoryPressure() {
    super.didHaveMemoryPressure();
    print("当内存过低的时候==");
  }

  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas 坐标轴"),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Text("页面前后台监控"),
      ),
    );
  }
}
