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

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example504(),
  ));
}


class Example504 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example504State();
  }
}
///代码清单 5-11 CustomScrollView 的基本使用
///lib/code/code5/example_504_CustomScrollView.dart
class _Example504State extends State<Example504> {

  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomScrollView"),
      ),
      body: CustomScrollView(
        //滑动控制器
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text("标题"),
            //标题居中
            centerTitle: true,
          )
        ],
      ),
    );
  } //Sl

}
