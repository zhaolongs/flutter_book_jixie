import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
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
