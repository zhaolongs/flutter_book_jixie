import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1606.dart
class ListViewUsePage6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///列表
      body: buildListView(),
    );
  }

  ///lib/code15/main_data1606.dart
  ///ListView 的基本使用
  ///通过custom来构建
  Widget buildListView() {
    return ListView.custom(
      ///一次性构建所有的子条目
      ///适用于少量数据
      childrenDelegate: SliverChildListDelegate(buildListWidget()),
    );
  }

  ///构建ListView中使用到的组件
  List<Widget> buildListWidget(){
    List<Widget> list = [];
    for (int i = 0; i < 20; i++) {
      list.add(new Container(
        height: 40,
        ///根据角标来动态计算生成不同的背景颜色
        color: Colors.cyan[100 * (i % 9)],
      ));
    }
    return list;
  }

  ///lib/code15/main_data1606.dart
  ///懒加载模式构建数据
  ///适用于构建大量数据
  Widget buildListView2() {
    return ListView.custom(
      childrenDelegate:
      SliverChildBuilderDelegate((BuildContext context, int index) {
        return new Container(
          height: 40,
          ///根据角标来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * (index % 9)],
        );
      }, childCount: 20),
    );
  }
}


///处定义代理
class CustomBuilderDelegate extends SliverChildBuilderDelegate {
  CustomBuilderDelegate(
      Widget Function(BuildContext, int) builder, {
        int childCount,
        bool addAutomaticKeepAlives = true,
        bool addRepaintBoundaries = true,
      }) : super(builder,
      childCount: childCount,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries);

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }
}
