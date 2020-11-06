import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_207_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example250(),
  ));
}

///代码清单 2-50
///lib/code/code2/example_appbar_250_page.dart
class Example250 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example250>
    with SingleTickerProviderStateMixin {

  //控制器
  TabController _tabController;
  //Tab集合
  List<Tab> tabs = <Tab>[];
  //主体页面的集合
  List<Widget> bodyList = [];

  @override
  void initState() {
    super.initState();
    //初始化Tab 如新闻资讯类型的APP的分类
    tabs = <Tab>[
      Tab(text: "Tab0",icon: Icon(Icons.add),),
      Tab(text: "Tab1",icon: Icon(Icons.android_rounded),),
      Tab(text: "Tab2",icon: Icon(Icons.ios_share),),
      Tab(text: "Tab3",icon: Icon(Icons.open_in_browser),),
      Tab(text: "Tab4",icon: Icon(Icons.file_upload),),
    ];

    //创建模拟页面 如新闻资讯类型的APP的分类列表
    for (int i= 0; i <tabs .length; i++) {
      bodyList.add(ItemPage(i));
    }

    //initialIndex初始选中第几个
    //[length] 标签的个数
    //[vsync]动画同步依赖
    _tabController =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  ///代码清单 2-50
  ///lib/code/code2/example_appbar_250_page.dart
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        //配置TabBar
        title: Text("标题"),
        bottom: TabBar(
          //可以和TabBarView关联使用同一个TabController
          controller: _tabController,
          //子Tab
          tabs: tabs,
          isScrollable: false,
        ),
        //标题居中
        centerTitle: true,
      ),
      //页面的主内容区
      body: TabBarView(
        //联动控制器
        controller: _tabController,
        //所有的子页面
        children: bodyList,
      ),
    );
  }
}


class ItemPage extends StatelessWidget{
  int index ;
  ItemPage(this.index);

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Text("当前页面索引 $index"),);
  }

}