import 'package:flutter/material.dart';

import 'app/app.dart';

///lib/main.dart
///程序的入口
void main() {
  ///启动根目录
  runApp(RootApp());
  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    ///debug模式下输出日志
    debugPrint(flutterErrorDetails.toString());
    return new Center(child: new Text("App错误，快去反馈给作者!"));
  };
}

