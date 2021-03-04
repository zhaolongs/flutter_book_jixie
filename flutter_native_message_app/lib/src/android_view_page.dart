import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/13.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
class AndroidViewPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<AndroidViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("调用 Android TextView Demo"),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Platform.isAndroid ? buildAndroidView() : buildUIKitView(),
            buildStreamBuilder(),
          ],
        ),
      ),
    );
  }

  //代码清单9-24 AndroidView的基本使用
  //lib/src/android_view_page.dart
  buildAndroidView() {
    return Container(
      height: 200,
      child: AndroidView(
        //设置标识
        viewType: "com.flutter_to_native_test_textview",
        //参数
        creationParams: {
          "content": " 34erw3 ",
        },
        onPlatformViewCreated: (int id) {
          //Android 原生的 View 创建后的回调
          _streamController.add(0.0);
        },
        //参数的编码方式
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }

  StreamController<double> _streamController = new StreamController();

  /// 监听Stream，每次值改变的时候，更新Text中的内容
  StreamBuilder<double> buildStreamBuilder() {
    return StreamBuilder<double>(
      ///绑定stream
      stream: _streamController.stream,

      ///默认的数据
      initialData: 1.0,

      ///构建绑定数据的UI
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        return AnimatedOpacity(
          opacity: snapshot.data,
          duration:Duration(microseconds: 1000),
          child: Container(
            color: Colors.red,
            width: double.infinity,
            height: 200,
          ),
        );
      },
    );
  }

  ///代码清单9-1-50 通过 UiKitView 来加载 iOS原生View
  ///lib/src/android_view_page.dart
  buildUIKitView() {
    return Container(
      height: 200,
      child: UiKitView(
        //标识
        viewType: "com.flutter_to_native_test_textview",
        creationParams: {
          "content": "flutter 传入的文本内容",
        },
        //参数的编码方式
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
