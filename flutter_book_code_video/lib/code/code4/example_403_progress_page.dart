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
    home: Example403(),
  ));
}

///代码清单 4-5 CupertinoSliverRefreshControl  下拉刷新
///lib/code/code4/example_403_progress_page.dart
class Example403 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example403> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("下拉刷新"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          //下拉刷新组件
          CupertinoSliverRefreshControl(
            //下拉刷新回调
            onRefresh: () async {
              //模拟网络请求
              await Future.delayed(Duration(milliseconds: 1000));
              //结束刷新
              return Future.value(true);
            },
          ),
          //列表
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              return ListTile(
                title: Text('测试数据$index'),
              );
            }, childCount: 100),
          )
        ],
      ),
    );
  }
}
