
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

//4.3 /lib/code3/main_data49.dart
//4.3 AppBar的bootom属性
class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<FirstPage>
    with SingleTickerProviderStateMixin {

  //控制器
  TabController _tabController;
  //Tab集合
  List<Tab> tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    //初始化Tab
    tabs = <Tab>[
      Tab(text: "Tab0",),
      Tab(text: "Tab1",),
      Tab(text: "Tab2",),
      Tab(text: "Tab3",),
      Tab(text: "Tab4",),
    ];
    //initialIndex初始选中第几个
    //[length] 标签的个数
    //[vsync]动画同步依赖
    _tabController = TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: buildAppBarTitle(),
        ///标题居中
        centerTitle: true,),
      ///页面的主内容区
      body: Center(child: Text("TabBar 的基本使用"),),);
  }

  //构建TabBar
  TabBar buildAppBarTitle() {
    //Row为线性布局，它可以使子Widget在水平方向线性排列
    return TabBar(
      //可以和TabBarView关联使用同一个TabController
      controller: _tabController,
      //子Tab
      tabs: tabs,
    );
  }

}
