import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item_page.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1605.dart
class ListViewUsePage5 extends StatefulWidget {
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


  ///lib/code15/main_data1605.dart
  ///ListView 的基本使用
  ///通过separated来构建
  Widget buildListView() {
    return ListView.separated(
      ///子条目个数
      itemCount: 10000,
      ///构建每个条目
      itemBuilder: (BuildContext context, int index) {
        ///这时将子条目单独封装在了一个StatefulWidget中
        return ListViewItemPage(index);
      },
      ///构建每个子Item之间的间隔Widget
      separatorBuilder: (BuildContext context, int index) {
        ///这里构建的时不同颜色的分隔线
        return new Container(
          height: 4,
          ///根据角标来动态计算生成不同的背景颜色
          color: Colors.cyan[100 * (index % 9)],
        );
      },
    );
  }
}
