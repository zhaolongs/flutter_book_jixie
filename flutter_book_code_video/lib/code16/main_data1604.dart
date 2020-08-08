import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item_page2.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1604.dart
class ListViewUsePage4 extends StatefulWidget {
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

  ///lib/code15/main_data1604.dart
  ///ListView.builder 的基本使用
  ///通过builder来构建
  Widget buildListView() {
    return ListView.builder(
      ///子条目个数
      itemCount: 10000,
      ///每个子条目的宽度
      itemExtent: 100,
      ///构建每个条目
      itemBuilder: (BuildContext context, int index) {
        ///子Item单独封装成了一个StatefulWidget
        return ListViewItemPage2(index);
      },
    );
  }
}
