import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_persistent_header_delegate.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1521.dart
/// SliverOverlapAbsorber
class ScrollBaseUsePage12 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),

      ///使用滑动布局包裹页面主体内容
      body: buildCustomScrollView(),
    );
  }

  ///lib/code15/main_data1521.dart
  ///构建一个 CustomScrollView
  Widget buildCustomScrollView() {
    return CustomScrollView(
      ///Sliver系列子组件
      slivers: [
        ///可折叠的头布局
        buildSliverPersistentHeader(),

        SliverFillRemaining(
          hasScrollBody: false,
          child: buildHeaderImage(),
        ),
      ],
    );
  }

  ///lib/code15/main_data1519.dart
  ///构建一个 SliverPersistentHeader
  Widget buildSliverPersistentHeader() {
    return SliverPersistentHeader(
      // 属性同 SliverAppBar
      pinned: true,
      floating: true,
      // 因为 SliverPersistentHeaderDelegate 是一个抽象类，所以需要自定义
      delegate: CustomSliverPersistentHeaderDelegate(
        max: 200.0,
        min: 80.0,
        child: buildHeaderImage(),
      ),
    );
  }

  ///lib/code15/main_data1519.dart
  ///构建一个图片
  Widget buildHeaderImage() {
    return Container(
      child: Image.asset(
        "assets/images/2.0x/banner4.webp",
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width,
        height: 200,
      ),
    );
  }

  ///lib/code15/main_data1519.dart
  ///SliverList 列表
  /// 通过构造方法方法来创建
  Widget buildSliverList() {
    return SliverList(
      delegate: new SliverChildBuilderDelegate(
        ///构建每个Item的具体显示UI
        (BuildContext context, int index) {
          //创建子widget
          return new Container(
            height: 44,
            alignment: Alignment.center,

            ///根据角标来动态计算生成不同的背景颜色
            color: Colors.cyan[100 * (index % 9)],
            child: new Text('grid item $index'),
          );
        },

        ///列表的条目个数
        childCount: 100,
      ),
    );
  }
}
