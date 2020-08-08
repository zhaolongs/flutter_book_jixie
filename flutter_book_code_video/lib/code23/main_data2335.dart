import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2335.dart
/// 实现径向Hero动画
class HeroPage3 extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

class _FlashAnimationPageState extends State<HeroPage3> {
  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: Rect.fromLTWH(100,400,100,400), end: Rect.fromLTWH(100,400,100,400));
  }

  /// lib/code23/main_data2335.dart
  List<Color> colorList = [
    Colors.blue[300],
    Colors.deepPurple[300],
    Colors.deepOrange[300],
    Colors.greenAccent[300],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      backgroundColor: Colors.grey[200],
      ///列表
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildContentWidget(index);
        },
        itemCount: colorList.length,
      ),
    );
  }

  /// lib/code23/main_data2335.dart
  /// 列表中的每个条目的Widget
  /// [index] 列表条目对应的索引
  buildContentWidget(int index) {
    ///手势事件点击跳转
    return GestureDetector(
        child: Container(
          ///边距设置
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
          ///Hero动画构建
          ///因为一个页面的中的Hero的tag必须是唯一的，
          ///所以在这里通过结合条目索引 index来设置
          ///然后在构建对应的详情页面时将这个tag也传过去
          child: Hero(
            createRectTween: _createRectTween,
              tag: 'hero$index',
              ///对应的子Item
              child: buildClipRRect(index)),
        ),
        onTap: () {
          ///跳转页面二
          ///参数一 Hero动画结合的tag
          ///参数二 页面交互的背景颜色
          routeItemPage("hero$index", colorList[index]);
        });
  }

  ClipRRect buildClipRRect(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 180,
        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/2.0x/banner4.webp",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Color(0x50ffffff),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              color: colorList[index],
            ),
          )
        ]),
      ),
    );
  }
  /// lib/code23/main_data2335.dart
  ///跳转页面二的自定义透明路由
  ///[heroTagName]参数一 为交互的 Hero使用到的tag名称
  ///[color]参数二 为交互使用的页面详情的背景颜色
  void routeItemPage(String heroTagName, Color color) {
    Navigator.of(context).push(
      ///自定义路由
      PageRouteBuilder(
        ///路由过渡切换时间
        transitionDuration: Duration(milliseconds: 3000),
        ///构造者
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          ///构建页面二
          return Item2Page(heroTagName, color);
        },
        ///交互动画
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          ///这里使用的一个透明渐变过渡的动画
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}

/// lib/code23/main_data2335.dart
class Item2Page extends StatefulWidget {
  final String heroTagName;
  final Color backgroundColor;

  Item2Page(this.heroTagName, this.backgroundColor);

  @override
  State<StatefulWidget> createState() {
    return _Item2PageState();
  }
}

class _Item2PageState extends State<Item2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: widget.backgroundColor,
        title: Text("页面二"),
      ),
      backgroundColor: widget.backgroundColor,

      ///页面二中的Hero
      body: Center(
        child: buildHero(),
      ),
    );
  }

  /// lib/code23/main_data2335.dart
  /// 页面二中的Hero
  Widget buildHero() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Hero(
        tag: widget.heroTagName,
        child: Image.asset(
          "assets/images/2.0x/banner1.webp",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
