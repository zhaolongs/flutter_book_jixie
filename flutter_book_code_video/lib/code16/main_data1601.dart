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

///lib/code15/main_data1601.dart
class ListViewBaseUsePage extends StatefulWidget {
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
      ///构建列表数据
      body: buildListView1(),
    );
  }
  ///ListView 的基本使用
  ///通过构造函数来创建
  Widget buildListView1(){
    return ListView(
      //可滚动widget公共参数

      ///滑动方向
      ///    Axis.vertical 竖直方向滑动
      ///    Axis.horizontal 水平方向滑动
      scrollDirection: Axis.vertical,
      ///设置为 true 时 列表数据是滑动到底部的
      ///    默认为false，列表数据在开始位置
      reverse: true,
      ///滑动到列表边界时的回弹效果
      physics:BouncingScrollPhysics(),
      /// 为true时ListVie的大小包裹子Widget
      /// 为false时 ListView填充父布局
      shrinkWrap: true,
      ///每个子条目的高度
      itemExtent: 80,
      ///
      cacheExtent: 200,
      ///子Item
      children: [
        buildListViewItemWidget(1),
        buildListViewItemWidget(2),
        buildListViewItemWidget(3),
        buildListViewItemWidget(4),
      ],
    );
  }

  ///lib/code15/main_data1601.dart
  ///创建ListView使用的子布局
  Widget buildListViewItemWidget(int index){
    return new Container(
      ///子条目的高度
      height: 84,
      ///内容剧中
      alignment: Alignment.center,
      ///根据角标来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }
}