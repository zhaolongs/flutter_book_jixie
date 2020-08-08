import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2337.dart

class SharedAxisTransitionPage extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

class _FlashAnimationPageState extends State<SharedAxisTransitionPage> {
  /// lib/code23/main_data2337.dart
  int _currentIndex = 0;
  List<Widget> pageList = [
    Item2Page(0),
    Item2Page(1),
  ];

  @override
  Widget build(BuildContext context) {
    Widget itemWidget = _currentIndex==0? Item2Page(0): Item2Page(1);
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 1500),
        reverse: true,
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            child: child,
            animation: animation,
            transitionType: SharedAxisTransitionType.vertical,
            secondaryAnimation: secondaryAnimation,
          );
        },
        child: itemWidget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('我的'), icon: Icon(Icons.perm_identity)),
        ],
      ),
    );
  }
}

/// lib/code23/main_data2337.dart
class Item2Page extends StatefulWidget {
  final int pageIndex;

  Item2Page(this.pageIndex);

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
        title: Text("页面二"),
      ),
      backgroundColor: widget.pageIndex == 0 ? Colors.blue : Colors.red,

      ///页面二
      body: Container(
        width:double.infinity,
        height:double.infinity,
        alignment: widget.pageIndex == 0 ? Alignment.topLeft : Alignment.bottomRight,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop(true);
          },
          child: Image.asset(
            "assets/images/2.0x/banner1.webp",
            fit: BoxFit.fill,
            width: 100,
          ),
        ),
      ),
    );
  }
}
