//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_global.dart';
import 'package:flutter_shop/src/common/global.dart';
import 'package:flutter_shop/src/page/catalogue/catalogue_main_page.dart';
import 'package:flutter_shop/src/page/custom_bottom_appbar.dart';
import 'package:flutter_shop/src/utils/log_util.dart';
import 'package:flutter_shop/src/utils/toast_utils.dart';

import '../mine/mine_main_page.dart';
import 'home_item2_page.dart';
import 'home_item_page.dart';
import 'home_item_scroll_page.dart';

///代码清单 13-1
///lib/src/page/home/home_main_page.dart
///主页面的根布局
class HomeMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMainState();
  }
}

class _HomeMainState extends State<HomeMainPage> {
  //[PageView]使用的控制器
  PageController _pageController = PageController();

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

  DateTime _lastQuitTime;

  @override
  Widget build(BuildContext context) {
    //点击Android手机的物理返回键
    //或者全面屏的手势退出功能
    return WillPopScope(
      child: buildScaffold(),
      //此方法会接收到监听
      onWillPop: () async {
        //计算时间差
        Duration flagDuration = DateTime.now().difference(_lastQuitTime);
        //两次点击间隔小于1秒时退出
        if (_lastQuitTime == null || flagDuration.inSeconds > 1) {
          ToastUtils.showToast("连续返回两次 退出应用");
          //获取当前的时间
          _lastQuitTime = DateTime.now();
          //拦截事件响应
          return false;
        } else {
          //退出
          Navigator.of(context).pop(true);
          //不拦截事件响应
          return true;
        }
      },
    );
  }

  Scaffold buildScaffold() {
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
          HomeItmeScrollPage(),
          //第二个页面
          HomeItemMainPage(),
          HomeItemMainPage(),
          //个人中心
          MineMainPage(),
        ],
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        //悬浮按钮 与其他菜单栏的结合方式
        shape: CircularNotchedRectangle(),
        // FloatingActionButton和BottomAppBar 之间的差距
        notchMargin: 6.0,
        //背景颜色
        color: Colors.white,
        child: CustomBottomAppBar(
          clickCallBack: (int index) {
            _pageController.jumpToPage(index);
          },
        ),
      ),
      //悬浮按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //悬浮按钮
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print("add press ");
        },
      ),
    );
  }
}
