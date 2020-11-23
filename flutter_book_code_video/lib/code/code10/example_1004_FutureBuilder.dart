import 'dart:async';
import 'dart:io';
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
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1004(),
  ));
}
/// 代码清单 10-12 FutureBuilder 的基本使用
/// lib/code/code10/example_1004_FutureBuilder.dart
class Example1004 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {
  Future<String> _testFuture;


  @override
  void initState() {
    super.initState();
    //模拟一个异步任务，如读取文件、网络请求等
    _testFuture = Future.delayed(Duration(milliseconds: 2000), () {
      return "模拟的数据";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureBuilder"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        //关键代码
        child: FutureBuilder<String>(
          //绑定 Future
          future: _testFuture,
          //默认显示的占位数据
          initialData: "",
          //需要更新数据对应的Widget
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text("${snapshot.data}");
          },
        ),
      ),
    );
  }
}
