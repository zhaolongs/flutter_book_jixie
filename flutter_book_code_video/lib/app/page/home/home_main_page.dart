//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/app/bean/bean_event.dart';
import 'package:flutterbookcode/app/common/event_message.dart';
import 'package:flutterbookcode/app/common/user_helper.dart';
import 'package:flutterbookcode/app/config/home_notifier.dart';
import 'package:flutterbookcode/app/page/catalogue/catalogue_main_page.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';
import 'package:flutterbookcode/app/res/string/strings_key.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:provider/provider.dart';

import '../mine/mine_main_page.dart';
import 'home_item_page.dart';

///lib/app/page/home/home_main_page.dart
///主页面的根布局
class HomeMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}

class FirstThemState extends State<HomeMainPage>  {

  //当前显示页面的标签
  int _tabIndex = 0;
  ///[PageView]使用的控制器
  PageController _pageController = PageController();

  //底部导航栏使用到的图标
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];

  //底部导航栏使用到的标题文字
  List<String> normalTitle = [
    StringKey.homeBottonTitle1,
    StringKey.homeBottonTitle2,
    StringKey.homeBottonTitle3,
  ];
  @override
  void initState() {
    super.initState();
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      SystemChrome.setSystemUIOverlayStyle(
//          Theme.of(context).brightness == Brightness.dark
//              ? SystemUiOverlayStyle.light
//              : SystemUiOverlayStyle.dark);
//      SystemChrome.setEnabledSystemUIOverlays(
//          [SystemUiOverlay.top, SystemUiOverlay.bottom]);
//    });
    //注册消息体
    EventMessage.getDefault().register((EventMessageBean bean) {
      if (bean.code == 100) {
        //刷新消息
        LogUtil.e("消息传递 刷新消息 ${bean.data.toString()}");
        if(_tabIndex!=bean.data){
          setState(() {
            _tabIndex = bean.data;
            _pageController.jumpToPage(_tabIndex);
          });
        }

      }
    });
  }
 @override
  void dispose() {
    super.dispose();
    ///注销消息兼听
    EventMessage.getDefault().unregister();
  }
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Consumer<HomeNotifier>(builder: (BuildContext context, HomeNotifier value, Widget child) {
        LogUtil.e("首页面接收到通知 ${value.homeIndex}");
        _tabIndex = value.homeIndex;
        return buildBodyFunction();
      },),
      //底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }



  ///lib/app/page/home/home_main_page.dart
  ///内容主体区域
  Widget buildBodyFunction() {
    return PageView(
      ///设置PageView不可滑动切换
      physics: NeverScrollableScrollPhysics(),
      ///PageView的控制器
      controller: _pageController,
      ///PageView中的三个子页面
      children: <Widget>[
        ///视频播放的列表
        HomeItemMainPage(),
        ///目录页面
        CatalogueMainPage(),
        ///我的
        MineMainPage(),
      ],
    );
  }
  ///lib/app/page/home/home_main_page.dart
  //构建底部导航栏
  BottomNavigationBar buildBottomNavigation() {
    //创建一个 BottomNavigationBar
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0],
            title: Text(StringLanguages.of(context).get(normalTitle[0]))),
        new BottomNavigationBarItem(
            icon: normalIcon[1],
            title: Text(StringLanguages.of(context).get(normalTitle[1]))),
        new BottomNavigationBarItem(
            icon: normalIcon[2],
            title: Text(StringLanguages.of(context).get(normalTitle[2]))),
      ],
      //显示效果
      type: BottomNavigationBarType.fixed,
      //当前选中的页面
      currentIndex: _tabIndex,
      //图标的大小
      iconSize: 24.0,
      //点击事件
      onTap: (index) {
        ///切换PageView中的页面显示
        _pageController.jumpToPage(index);
        _tabIndex = index;
        setState(() {});
      },
    );
  }
}
