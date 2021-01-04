import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'play/play_list_page.dart';
///代码清单 12-19
///首页面视频播放页面
///lib/src/page/home/home_item_page.dart
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  ///代码清单 12-24
  ///lib/src/page/home/home_item_page.dart
  ///
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

  ///代码清单 12-20
  ///首页面的状态栏背景为黑色，文字为白色
  ///lib/src/page/home/home_item_page.dart
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //状态文字设置为魄
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
  ///代码清单 12-21
  ///首页面的主体内容
  ///lib/src/page/home/home_item_page.dart
  Scaffold buildScaffold() {
    return Scaffold(
      //层叠布局
      body: Stack(
        children: <Widget>[
          //视频
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

  ///代码清单 12-22
  ///第一层 构建 TabBarView
  ///lib/src/page/home/home_item_page.dart
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

  ///代码清单 12-23
  /// 第二层 构建顶部标签部分
  ///lib/src/page/home/home_item_page.dart
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
