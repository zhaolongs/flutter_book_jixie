import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1526.dart
/// CupertinoScrollbar 基本使用
class ScrollableUsePage extends StatefulWidget {
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
      ///使用滑动监听来包裹子Widget
      ///以获取滑动相关信息而进行页面特效的操作
      body: NotificationListener(
          ///监听到通知的回调
          onNotification: (ScrollNotification notification) {
            ///返回值类型为布尔值，当返回值为true时，阻止冒泡，
            ///其父级Widget将再也收不到该通知；
            ///当返回值为false 时继续向上冒泡通知。
            return true;
          },
          ///滑动视图 如 ScrollView系列、ListView、GridView等等
          child: buildScrollbar()),
    );
  }

  ///构建一个ListView
  ///使用 Scrollbar 实现一个 滑动滚动条
  Widget buildScrollbar() {
    ///滑动视图
    return CupertinoScrollbar(
      ///构建一个ListView
      child: buildListView(),
    );
  }

 ///构建一个列表ListView
 ListView buildListView() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          height: 44,
          alignment: Alignment.center,
          ///根据角标来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * ((index + 1) % 9)],
          child: new Text(' item $index'),
        );
      },
      itemCount: 100,
    );
 }
}