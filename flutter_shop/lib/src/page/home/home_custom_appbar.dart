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
/// 代码清单
///代码清单
class HomeCustomAppBar extends StatefulWidget {
  final List<Tab> tabList;
  final TabController tabController;
  final double value;

  final double value2;

  HomeCustomAppBar({
    this.tabController,
    this.tabList,
    this.value,
    this.value2,
  });

  @override
  _HomeCustomAppBarState createState() => _HomeCustomAppBarState();
}

class _HomeCustomAppBarState extends State<HomeCustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQueryData.fromWindow(window).padding.top,
          right: 0,
          height: 40,
          left: 0,
          child: Container(
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
          ),
        ),
        Positioned(
          top: MediaQueryData.fromWindow(window).padding.top +
              44 * (1.0 - widget.value2),
          right: 0,
          height: 38,
          left: 12,
          child: SearchWidget(
            value: widget.value,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: buildTabBar(),
        )
      ],
    );
  }

  Widget buildTabBar() {
    if (widget.tabController == null) {
      return Container();
    }
    return TabBar(
      isScrollable: true,
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      controller: widget.tabController,
      tabs: widget.tabList,
    );
  }
}
