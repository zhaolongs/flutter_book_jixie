import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/base/banner.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

import 'example_506_NestScrollView.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021511098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.grey[200]),
    home: Example511(),
  ));
}

class Example511 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example511> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("GridView "),
      ),
      body: buildGridView1(),
    );
  }

  ///代码清单 5-43 GridView 通过构造函数来创建
  ///lib/code/code5/example_511_GridView.dart
  Widget buildGridView1() {
    return GridView(
      //子Item排列规则
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 2,
          //纵轴间距
          mainAxisSpacing: 10.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 1.4),
      //GridView中使用的子Widegt
      children: [
        buildListViewItemWidget(1),
        buildListViewItemWidget(2),
        buildListViewItemWidget(3),
        buildListViewItemWidget(4),
        buildListViewItemWidget(5),
        buildListViewItemWidget(6),
        buildListViewItemWidget(7),
      ],
    );
  }

  ///代码清单 5-44 GridView 子Item视图构建
  ///lib/code/code5/example_511_GridView.dart
  Widget buildListViewItemWidget(int index) {
    return new Container(
      //列表子Item的高度
      height: 84,
      //内容剧中
      alignment: Alignment.center,
      //根据索引来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text('grid item $index'),
    );
  }

  ///代码清单 5-45 GridView 通过构造函数来创建
  ///lib/code/code5/example_511_GridView.dart
  Widget buildGridView2() {
    return GridView(
      //子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //子Item的最大宽度
        maxCrossAxisExtent: 120,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      //GridView中使用的子Widegt
      children: [
        buildListViewItemWidget(1),
        buildListViewItemWidget(2),
        buildListViewItemWidget(3),
        buildListViewItemWidget(4),
        buildListViewItemWidget(5),
        buildListViewItemWidget(6),
        buildListViewItemWidget(7),
      ],
    );
  }

  ///代码清单 5-46 GridView count 方式来创建 适用于少量数据
  ///lib/code/code5/example_511_GridView.dart
  Widget buildGridView3() {
    return GridView.count(
      //每行的列数
      crossAxisCount: 4,
      //纵轴间距
      mainAxisSpacing: 10.0,
      //横轴间距
      crossAxisSpacing: 10.0,
      //所有的子条目
      children: [
        buildListViewItemWidget(1),
        buildListViewItemWidget(2),
        buildListViewItemWidget(3),
        buildListViewItemWidget(4),
        buildListViewItemWidget(5),
        buildListViewItemWidget(6),
        buildListViewItemWidget(7),
      ],
    );
  }

  ///代码清单 5-47 GridView extent 方式来创建 适用于少量数据
  ///lib/code/code5/example_511_GridView.dart
  Widget buildGridView4() {
    return GridView.extent(
      //每列Item的最大宽度
      maxCrossAxisExtent: 120,
      //纵轴间距
      mainAxisSpacing: 10.0,
      //横轴间距
      crossAxisSpacing: 10.0,
      //所有的子条目
      children: [
        buildListViewItemWidget(1),
        buildListViewItemWidget(2),
        buildListViewItemWidget(3),
        buildListViewItemWidget(4),
        buildListViewItemWidget(5),
        buildListViewItemWidget(6),
        buildListViewItemWidget(7),
      ],
    );
  }

  ///代码清单 5-48 GridView builder 方式来创建
  ///懒加载模式 适用于大量数据
  ///lib/code/code5/example_511_GridView.dart
  Widget buildGridView5() {
    return GridView.builder(
      //缓存区域
      cacheExtent: 120,
      //内边距
      padding: EdgeInsets.all(8),
      //条目个数
      itemCount: 100,
      //子Item排列规则
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //子Item的最大宽度
        maxCrossAxisExtent: 100,
        //纵轴间距
        mainAxisSpacing: 10.0,
        //横轴间距
        crossAxisSpacing: 10.0,
        //子组件宽高长度比例
        childAspectRatio: 1.4,
      ),
      //懒加载构建子条目
      itemBuilder: (BuildContext context, int index) {
        return buildListViewItemWidget(index);
      },
    );
  }

  ScrollController _scrollController = new ScrollController();

  void test() {
    ListView(
      controller: _scrollController,
      children: [],
    );
    GridView(
      controller: _scrollController,
      children: [],
    );
  }
}
