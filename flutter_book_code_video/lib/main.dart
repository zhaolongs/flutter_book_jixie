import 'package:flutter/material.dart';
import 'app/app_root.dart';

///lib/main.dart
///程序的入口
void main() {
  ///启动根目录
  runApp(AppRootPage());

  /// 自定义报错页面
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    ///debug模式下输出日志
    debugPrint(flutterErrorDetails.toString());
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "App错误，快去反馈给作者!${flutterErrorDetails.exception}",
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  };
}
