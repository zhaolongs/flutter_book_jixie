import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example217(),
  ));
}

///代码清单 2-20 顶部标签栏
///lib/code/code2/example_217_appbar_page.dart
class Example217 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example217>
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
      Tab(text: "Tab0",),
      Tab( text: "Tab1",),
      Tab(text: "Tab3",),
      Tab( text: "Tab4",),
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
  ///代码清单 2-21 顶部标签栏
  ///lib/code/code2/example_217_appbar_page.dart
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        //配置TabBar
        title: TabBar(
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