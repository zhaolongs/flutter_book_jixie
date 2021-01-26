import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/app_root_page.dart';

///lib/main.dart
///快速开发模模版
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
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
