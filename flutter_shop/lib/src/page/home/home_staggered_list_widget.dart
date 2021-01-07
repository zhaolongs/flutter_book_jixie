import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/utils/log_util.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/6.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///首页面的瀑布流
class HomeStaggeredWidget extends StatefulWidget {
  @override
  _HomeStaggeredWidgetState createState() => _HomeStaggeredWidgetState();
}

class _HomeStaggeredWidgetState extends State<HomeStaggeredWidget> {
  bool _isScroll = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {});
  }

  double lastDownY = 0.0;
  double downY = 0.0;

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      physics: ClampingScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      itemCount: 100,
      itemBuilder: (context, i) {
        return itemWidget(i);
      },
      //  staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index == 0 ? 2.5 : 3),
      //
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }

  Widget itemWidget(int index) {
    return new Material(
      elevation: 8.0,
      borderRadius: new BorderRadius.all(
        new Radius.circular(8.0),
      ),
      child: new InkWell(
        onTap: () {},
        child: new Hero(
          tag: "$index",
          child: Image.asset(
            "assets/images/2.0x/s01.jpeg",
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
