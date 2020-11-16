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
    home: Example512(),
  ));
}

///代码清单 5-49 ListView 下拉刷新、上拉加载更多
///lib/code/code5/example_513_ListView_RefreshIndicator.dart
class Example512 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example512> {
  //ListView 中使用到的数据集合
  List<String> _list = [];
  //ListView 中使用的滑动控制器
  ScrollController _scrollController = new ScrollController();
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

    //添加滑动监听 在这里实现的是预一屏加载
    //也就是当数据滑动查看还只剩下一屏显示时
    //如果用户还在滑动就触发加载更多数据功能
    //如果网络通常的情况下就可达成静默加载效果
    _scrollController.addListener(() {
      //获取滑动的距离
      double offset = _scrollController.offset;
      //ListView 可滑动的最大距离
      double maxOffset = _scrollController.position.maxScrollExtent;
      //当前视图的一屏高度
      double height = MediaQuery.of(context).size.height;
      if(offset>=maxOffset-height && !isLoadingMore){
        print("上拉加载更多");
        //更新标识 防止重复调用
        isLoadingMore = true;
        //当前数据页数更新
        pageIndex++;
        //加载更多数据方法
        loadMoreData();
      }
    });
  }

  ///代码清单 5-50
  ///lib/code/code5/example_513_ListView_RefreshIndicator.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ListView RefreshIndicator"),
      ),
      body: RefreshIndicator(
          //圆圈进度颜色
          color: Colors.blue,
          //下拉停止的距离
          displacement: 44.0,
          //背景颜色
          backgroundColor: Colors.grey[200],
          //下拉刷新的回调
          onRefresh: () async {
            //模拟网络请求
            await Future.delayed(Duration(milliseconds: 2000));
            //清空数据
            _list.clear();
            //向集合中添加新的元素
            for (var i = 10; i < 30; ++i) {
              _list.add("刷新测试数据 $i");
            }
            //结束刷新
            return Future.value(true);
          },
          child: buildListView()),
    );
  }

  ///代码清单 5-51  页面显示的列表 ListView
  ///lib/code/code5/example_513_ListView_RefreshIndicator.dart
  Widget buildListView() {
    return ListView.builder(
      controller: _scrollController,
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

  ///代码清单 5-52 上拉加载更多
  ///实际业务开发中就是网络请求的数据
  ///lib/code/code5/example_513_ListView_RefreshIndicator.dart
  void loadMoreData() async{
    //向集合中添加新的元素
    for (var i = 10; i < 30; ++i) {
      _list.add("第 $pageIndex 页数据 $i");
    }
    isLoadingMore = false;
    //当然在这里可以做一步优化就是在滑动停止时再更新
    setState(() {

    });
  }
}