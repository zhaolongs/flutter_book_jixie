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

///lib/code15/main_data1518.dart
///Sliver内边距SliverPadding
class ScrollBaseUsePage9 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///使用滑动布局包裹页面主体内容
      body: buildCustomScrollView(),
    );
  }


  ///lib/code15/main_data1518.dart
  ///构建一个 SliverToBoxAdapter
  ///加载一个 普通的 Container 容器组件
  Widget buildCustomScrollView() {
    return CustomScrollView(slivers: [

      SliverPadding(
        ///内边距
        padding: EdgeInsets.all(10.0),
        ///Sliver子组件
        sliver: buildSliverList(),
      )

    ],);
  }

  ///lib/code15/main_data1518.dart
  ///SliverList 列表
  /// 通过构造方法方法来创建
  Widget buildSliverList() {
    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        ///构建每个Item的具体显示UI
            (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,
            ///根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },
        ///列表的条目个数
        childCount: 100,
      ),
    );
  }


}
