import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/base/banner.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'example_506_NestScrollView.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021512098.htm
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
    home: Example514(),
  ));
}

///代码清单 5-53 ListView 下拉刷新、上拉加载更多
///lib/code/code5/example_514_ListView_SmartRefresher.dart
class Example514 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example514> {
  //ListView 中使用到的数据集合
  List<String> _list = [];

  //是否在加载更多
  bool isLoadingMore = false;

  //当前加载的页数
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();

    //初始化的模拟数据
    for (var i = 0; i < 20; ++i) {
      _list.add("测试数据 $i");
    }
  }

  ///代码清单 5-50
  ///lib/code/code5/example_514_ListView_SmartRefresher.dart
  ///
  RefreshController _refreshController = new RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ListView SmartRefresher"),
      ),
      body: SmartRefresher(
        //开启上拉加载更多
        enablePullUp: true,
        //下拉刷新回调
        onRefresh: () async {
          //模拟网络请求
          await Future.delayed(Duration(milliseconds: 2000));
          //清空数据
          _list.clear();
          //向集合中添加新的元素
          for (var i = 10; i < 30; ++i) {
            _list.add("刷新测试数据 $i");
          }
          //结束下拉刷新
          _refreshController.refreshCompleted();
        },
        //上拉加载更多回调
        onLoading: () async {
          pageIndex++;
          //模拟网络请求
          await Future.delayed(Duration(milliseconds: 2000));
          //清空数据
          _list.clear();
          //向集合中添加新的元素
          for (var i = 10; i < 30; ++i) {
            _list.add("第 $pageIndex 页数据 $i");
          }
          setState(() {

          });
          //结束上拉加载更多
          _refreshController.loadComplete();
        },
        controller: _refreshController,
        child: buildListView(),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      //列表子Item个数
      itemCount: _list.length,
      //每个列表子Item的高度
      itemExtent: 100,
      //构建每个ListView的Item
      itemBuilder: (BuildContext context, int index) {
        //子Item可单独封装成一个StatefulWidget
        //也可以是一个 Widget
        return buildListViewItemWidget(index);
      },
    );
  }

  Widget buildListViewItemWidget(int index) {
    return new Container(
      //列表子Item的高度
      height: 84,
      //内容剧中
      alignment: Alignment.center,
      //根据索引来动态计算生成不同的背景颜色
      color: Colors.cyan[100 * (index % 9)],
      child: new Text(' ${_list[index]}'),
    );
  }
}
