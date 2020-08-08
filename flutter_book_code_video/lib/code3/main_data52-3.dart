import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.5.2 /lib/code3/main_data52-3.dart
// iconTheme 的配置使用
///应用入口 
main() =>
    runApp(
        MaterialApp(
          //主题
          theme: ThemeData(
            ///Icon的主要的主题样式配置
              primaryIconTheme:IconThemeData(
                ///紫色
                color: Colors.grey,
                ///大小
                size:33,
                ///透明度
                opacity: 1,
              ),
            //AppBar中的专属配置
            appBarTheme: AppBarTheme(
              ///AppBar中通用Icon的样式配置
              iconTheme: IconThemeData(
                ///紫色
                color: Colors.deepOrange,
                ///大小
                size:44,
                ///透明度
                opacity: 1,
              ),
              actionsIconTheme:IconThemeData(
                ///紫色
                color: Colors.yellow,
                ///大小
                size:33,
                ///透明度
                opacity: 1,
              ),
            )
          ),
          home: FirstPage(),));


//4.5.2 /lib/code3/main_data52-3.dart
// iconTheme 的配置使用

//页面FirstPage
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
      body: Column(children: <Widget>[
        FlatButton(
          child: Text("点击跳转第二个页面"),
          onPressed: () {
            Navigator.of(context).push(
              new MaterialPageRoute(
                //是否全屏显示
                fullscreenDialog: true,
                //构建页面
                builder: (_) {
                  return new ScendPage();
                },),);
          },
        ),
      ],),
    );
  }
}

//页面ScendPage
//跳转到第二个页面ScendPage中，在ScendPage中获取上一个页面参数
class ScendPage extends StatefulWidget {
  @override
  ScendPageState createState() => ScendPageState();
}

//4.5.2 /lib/code3/main_data52-3.dart
// iconTheme 的配置使用
class ScendPageState extends State<ScendPage> with SingleTickerProviderStateMixin {

  TabController controller;
  var tabs = <Tab>[];

  //页面创建时执行的第一个方法
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
    )];
    //initialIndex初始选中第几个
    controller =
        TabController(initialIndex: 3, length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: FlatButton(
          child: Text("点击返回第一个页面"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      endDrawer: Container(width: 100, color: Colors.white,),
    );
  }

  //4.5.2 /lib/code3/main_data52-3.dart
  // iconTheme 的配置使用
  AppBar buildAppBar() {
    return AppBar(
      title: Text("第二个页面"),
      leading: Icon(
        Icons.arrow_back,),
      ///右侧图标区域
      actions: [
        Container(
          child: Icon(Icons.message), margin: EdgeInsets.only(right: 12),),
        Container(
          child: Icon(Icons.share), margin: EdgeInsets.only(right: 12),),
      ],
      bottom: buildAppBarBottom(),
    );
  }

  TabBar buildAppBarBottom() {
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