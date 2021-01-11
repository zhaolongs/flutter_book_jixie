//3.3 /lib/code2/main_data35.dart
//bottomNavigationBar配制底部导航栏菜单
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/bean/bean_global.dart';
import 'package:flutter_shop/src/common/global.dart';
import 'package:flutter_shop/src/page/custom_bottom_appbar.dart';
import 'package:flutter_shop/src/utils/log_util.dart';
import 'package:flutter_shop/src/utils/toast_utils.dart';

import '../catalogue/home_item_catalogue_page.dart';
import '../mine/mine_main_page.dart';
import 'home_item_scroll_page.dart';

///代码清单 13-13
///lib/src/page/home/home_main_page.dart
///主页面的根布局
class HomeMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeMainState();
  }
}

class _HomeMainState extends State<HomeMainPage> {


  //全局通信监听对象
  StreamSubscription _homeSubscription;

  @override
  void initState() {
    super.initState();
    //设置全局通信监听 Stream 跨组件Widget通信
    _homeSubscription =
        rootStreamController.stream.listen((GlobalBean globalBean) {
      //消息
      LogUtil.e("消息传递 刷新消息 ${globalBean.data.toString()}");
    });

    Future.delayed(Duration.zero, () {
      //设置焦点监听
      FocusScope.of(context).addListener(() {
        // 获取当前焦点
        bool isFirstFocus = FocusScope.of(context).isFirstFocus;
        LogUtil.e("焦点 isFirstFocus $isFirstFocus");
        //如果可见时 读取剪切版数据
        readClipboard();
      });
    });

    //第一次进入时需要读取一下剪切板
    readClipboard();
  }

  void readClipboard(){
    //在这里可以解析指定格式的数据来弹出对应的功能操作
    var text = Clipboard.getData(Clipboard.kTextPlain);
  }

  @override
  void dispose() {
    super.dispose();
    //移除监听
    _homeSubscription.cancel();
  }
  ///代码清单 13-14
  ///lib/src/page/home/home_main_page.dart
  ///[HomeMainPage]中定义方法
  //上一次点击的时间
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
  ///代码清单 13-18
  ///lib/src/page/home/home_main_page.dart
  ///[HomeMainPage]中定义方法
  //[PageView]使用的控制器
  PageController _pageController = PageController();
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
          //第三个页面
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
        //自定义底部菜单栏
        child: CustomBottomAppBar(
          tipsIndex: 1,
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
