//4.1.1 /lib/code3/main_data43.dart
//4.1.1线性布局Row在属性title中的使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              ///配置AppBar中title的文字样式
              textTheme: TextTheme(
                headline6: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),),
            ),),));

//4.2 /lib/code3/main_data47.dart
//TabBar结合TabBarView  TabBar的基本使用
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
      Tab(child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mood),
          SizedBox(width: 6,),
          Text("标签0")],),),
      Tab(child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.money_off),
          SizedBox(width: 6,),
          Text("标签1")],),),
      Tab(child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.new_releases),
          SizedBox(width: 6,),
          Text("标签2")
        ],),),
      Tab(child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.notifications_active),
          SizedBox(width: 6,),
          Text("标签3")
        ],),),
      Tab(child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.photo_camera),
          SizedBox(width: 6,),
          Text("标签4")
        ],),),

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
        ///配置TabBar
        title: buildAppBarTitle(),
        ///标题居中
        centerTitle: true,),
      ///页面的主内容区
      body: Center(child: Text("TabBar 的基本使用"),),);
  }

  //构建TabBar
  TabBar buildAppBarTitle() {
    return TabBar(
      //可以和TabBarView关联使用同一个TabController
      controller: _tabController,
      //子Tab
      tabs: tabs,
      //可滑动
      isScrollable: true,
    );
  }

}
