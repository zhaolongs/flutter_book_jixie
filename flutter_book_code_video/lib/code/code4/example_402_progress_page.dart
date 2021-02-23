import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example402(),
  ));
}


class Example402 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example402State();
  }
}
///代码清单 4-4 Material风格的滑动刷新Widget
///lib/code/code4/example_402_progress_page.dart
class _Example402State extends State<Example402> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新"),
      ),
      body: RefreshIndicator(
        //圆圈进度颜色
        color: Colors.blue,
        //下拉停止的距离
        displacement: 44.0,
        //背景颜色
        backgroundColor: Colors.grey[200],
        onRefresh: () async{
          //模拟网络请求
          await Future.delayed(Duration(milliseconds: 1000));
          //结束刷新
          return Future.value(true);
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
