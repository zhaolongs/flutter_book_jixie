import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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
