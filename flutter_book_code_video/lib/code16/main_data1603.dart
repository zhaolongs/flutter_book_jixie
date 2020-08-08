import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item_page3.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */


///lib/code15/main_data1603.dart
///ListView使用的数据模型
class ListDemoBean{
  ///当前item的标题
  String title;
  ///当前item是否选中
  bool isSelect = false;
  ///文本输入框输入的内容
  String inputString="";

  ListDemoBean(this.title);
}

///lib/code15/main_data1603.dart
///ListView 的Item状态保持方案二
class ListViewUsePage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///ListView使用的数据
  List<ListDemoBean> list = [];

  @override
  void initState() {
    super.initState();
    ///构建模拟数据
    for (int i = 0; i < 10000; i++) {
      list.add(ListDemoBean("测试数据 $i"));
    }
  }
  ///lib/code15/main_data1603.dart
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

  ///通过builder来构建ListView
  Widget buildListView() {
    return ListView.builder(
      /// 当设置为true时，子Item保存状态
      addAutomaticKeepAlives: true,
      ///子条目个数
      itemCount: list.length,
      ///构建每个条目
      itemBuilder: (BuildContext context, int index) {
        ///取出每个条目对应的数据
        ListDemoBean demoBean = list[index];
        ///构建每个Item显示的数据
        return ListViewItemPage3(demoBean);
      },
    );
  }
}
