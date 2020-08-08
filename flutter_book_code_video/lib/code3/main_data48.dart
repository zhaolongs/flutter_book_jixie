//4.1.1 /lib/code3/main_data43.dart
//4.1.1线性布局Row在属性title中的使用
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.1.1 /lib/code3/main_data43.dart
//线性布局Row在属性title中的使用
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

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<FirstPage>  with SingleTickerProviderStateMixin {

  TabController controller;
  var tabs = <Tab>[];
  @override
  void initState() {
    super.initState();
    tabs = <Tab>[

      Tab(
        text: "Tab1",
        icon: Icon(Icons.markunread),
      ),
      Tab(
        text: "Tab2",
        icon: Icon(Icons.mic),
      ),
      Tab(
        text: "Tab3",
        icon: Icon(Icons.map),
      ),
      Tab(
        text: "Tab4",
        icon: Icon(Icons.crop_original),
      ),
      Tab(
        text: "Tab5",
        icon: Icon(Icons.message),
      ),
    ];

    //initialIndex初始选中第几个
    controller =
        TabController(initialIndex: 3, length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: buildAppBarTitle(),centerTitle: true,),
      ///页面的主内容区
      body: Center(child: Text("首页面"),),);
  }



  TabBar buildAppBarTitle() {
    //TabBar 用来配置横向滑动的标签栏
    return TabBar(
      //可以和TabBarView使用同一个TabController
      controller: controller,
      tabs: tabs,
      isScrollable: true,
      indicatorColor: Color(0xffff0000),
      indicatorWeight: 1,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.only(bottom: 10.0),
      labelPadding: EdgeInsets.only(left: 20),
      labelColor: Color(0xff333333),
      labelStyle: TextStyle(
        fontSize: 15.0,
      ),
      unselectedLabelColor: Color(0xffffffff),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.0,
      ),
    );
  }
}
