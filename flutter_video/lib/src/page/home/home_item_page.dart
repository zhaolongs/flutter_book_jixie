import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'play/play_list_page.dart';

//lib/src/page/home/home_item_page.dart
//首页面显示的视频列表播放页面
//首页面显示的视频列表播放页面
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}

//使用到[TabBar] 所以要绑定一个Ticker
//当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class MainFindPage3State extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  ///[TabBar]使用的文本
  List<String> tabTextList = ["关注", "推荐"];

  ///[TabBar]使用的[Tab]集合
  List<Tab> tabWidgetList = [];

  ///[TabBar]的控制器
  TabController tabController;

  @override
  void initState() {
    super.initState();

    //构建TabBar中使用的Tab数据
    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }
    //创建TabBar使用的控制器
    tabController = new TabController(length: tabTextList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //黑色
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //设置状态栏的颜色 有AppBar时，会被覆盖
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: buildScaffold(),
      value: SystemUiOverlayStyle(
          //状态栏的背景黑色
          statusBarColor: Colors.black87,
          //状态栏文字颜色为白色
          statusBarIconBrightness: Brightness.light,
          //底部navigationBar背景颜色
          systemNavigationBarColor: Colors.white),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      //层叠布局
      body: Stack(
        children: <Widget>[
          //视频列表
          Positioned.fill(
            child: buildTabBarView(),
          ),
          //顶部选项卡
          Positioned.fill(
            top: 54,
            child: buildTabBar(),
          ),
        ],
      ),
    );
  }

  //视频列表
  //构建 TabBarView
  Widget buildTabBarView() {
    return TabBarView(
      controller: tabController,
      children: [
        PlayListPage(
          pageIndex: 0,
        ),
        PlayListPage(
          pageIndex: 0,
        )
      ],
    );
  }

  //构建顶部标签部分
  Widget buildTabBar() {
    return Container(
      //对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,
        //指示器的颜色
        indicatorColor: Colors.white,
        //指示器的高度
        indicatorWeight: 2.0,
        //可滑动
        isScrollable: true,
        //指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}
