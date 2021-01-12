import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/page/common/search_widget.dart';

import 'image_text_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/7.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-29
///lib/src/page/home/home_custom_appbar.dart
class HomeCustomAppBar extends StatefulWidget {
  //标签栏集合
  final List<Tab> tabList;
  //标签栏控制器
  final TabController tabController;
  //搜索框横向缩短使用 0.0~1.0
  final double value;
  //搜索框向上平移使用 0.0~1.0
  final double value2;

  HomeCustomAppBar({
    this.tabController,
    this.tabList,
    this.value = 0.0,
    this.value2 = 0.0,
  });

  @override
  _HomeCustomAppBarState createState() => _HomeCustomAppBarState();
}

class _HomeCustomAppBarState extends State<HomeCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //顶部的文字区域
        Positioned(
          top: MediaQueryData.fromWindow(window).padding.top,
          right: 0,
          height: 40,
          left: 0,
          child: buildHeaderText(),
        ),
        //第二部分的搜索框
        Positioned(
          //动态计算
          top: MediaQueryData.fromWindow(window).padding.top +
              44 * (1.0 - widget.value2),
          //距离右侧边距 用来限制搜索框的大小
          right: 12+MediaQuery.of(context).size.width/3* widget.value,
          height: 38,
          left: 12,
          //搜索框
          child: SearchWidget(),
        ),
        //第三部分的 标签栏
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: buildTabBar(),
        )
      ],
    );
  }
  ///代码清单 13-31
  ///lib/src/page/home/home_custom_appbar.dart
  ///[HomeCustomAppBar]第一部分的文字区域
  Container buildHeaderText() {
    return Container(
      padding: EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "早起的年轻人",
            style: TextStyle(color: Colors.white),
          )),
          ImageTextWidget(
            image: 'assets/images/2.0x/header_icon1.png',
          ),
          ImageTextWidget(
            image: 'assets/images/2.0x/header_icon2.png',
          ),
          ImageTextWidget(
            image: 'assets/images/2.0x/header_icon3.png',
          ),
        ],
      ),
    );
  }
  ///代码清单 13-30
  /// TabBar 标签栏
  ///  ///lib/src/page/home/home_custom_appbar.dart
  Widget buildTabBar() {
    if (widget.tabController == null) {
      return Container();
    }
    return TabBar(
      //可滑动
      isScrollable: true,
      //未选中文本样式
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      //选中文本样式
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      //标签控制器
      controller: widget.tabController,
      //所有的标签
      tabs: widget.tabList,
    );
  }
}
