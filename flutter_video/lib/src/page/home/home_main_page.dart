//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_global.dart';
import 'package:flutter_video/src/common/global.dart';
import 'package:flutter_video/src/page/catalogue/catalogue_main_page.dart';
import 'package:flutter_video/src/utils/log_util.dart';

import '../mine/mine_main_page.dart';
import 'home_item_page.dart';

//lib/src/page/home/home_main_page.dart
//主页面的根布局
class HomeMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMainState();
  }
}

class _HomeMainState extends State<HomeMainPage> {
  //当前显示页面的标签
  int _tabIndex = 0;
  //[PageView]使用的控制器
  PageController _pageController = PageController();
  //底部导航栏使用到的图标
  List<Icon> _normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];
  //底部导航栏使用到的标题文字
  List<String> _normalTitle = [
    "首页",
    "列表",
    "我的",
  ];
  StreamSubscription _homeSubscription;

  @override
  void initState() {
    super.initState();
    _homeSubscription =
        rootStreamController.stream.listen((GlobalBean globalBean) {
      //刷新消息
      LogUtil.e("消息传递 刷新消息 ${globalBean.data.toString()}");
    });
  }

  @override
  void dispose() {
    super.dispose();
    //移除监听
    _homeSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: PageView(
        //设置PageView不可滑动切换
        physics: NeverScrollableScrollPhysics(),
        //PageView的控制器
        controller: _pageController,
        //PageView中的三个子页面
        children: <Widget>[
          //第一个页面
          HomeItemMainPage(),
          //第二个页面
          CatalogueMainPage(),
          //个人中心
          MineMainPage(),
        ],
      ),
      //底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  //lib/src/page/home/home_main_page.dart
  //构建底部导航栏
  BottomNavigationBar buildBottomNavigation() {
    //创建一个 BottomNavigationBar
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(label: _normalTitle[0], icon: _normalIcon[0]),
        new BottomNavigationBarItem(icon: _normalIcon[1], label: _normalTitle[1]),
        new BottomNavigationBarItem(icon: _normalIcon[2], label: _normalTitle[2]),
      ],
      //显示效果
      type: BottomNavigationBarType.fixed,
      //当前选中的页面
      currentIndex: _tabIndex,
      //图标的大小
      iconSize: 24.0,
      //点击事件
      onTap: (index) {
        //切换PageView中的页面显示
        _pageController.jumpToPage(index);
        _tabIndex = index;
        setState(() {});
      },
    );
  }
}
