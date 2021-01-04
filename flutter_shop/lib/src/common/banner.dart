import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/12.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///
///代码清单 5-27 一个轮播图的实现
///lib/code/code5/example_504_CustomScrollView.dart
class BannerWidget extends StatefulWidget {
  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  //轮播图 PageView 使用的控制器
  PageController _pageController;

  //定时器自动轮播
  Timer _timer;

  //本地资源图片
  List<String> imageList = [
    "assets/images/2.0x/banner1.webp",
    "assets/images/2.0x/banner2.webp",
    "assets/images/2.0x/banner3.webp",
    "assets/images/2.0x/banner4.webp",
  ];

  //当前显示的索引
  int currentIndex = 1000;

  @override
  void initState() {
    super.initState();
    //初始化控制器
    // initialPage 为初始化显示的子Item
    _pageController = new PageController(initialPage: currentIndex);

    ///当前页面绘制完第一帧后回调
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startTimer();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //停止计时
    _timer.cancel();
  }

  void startTimer() {
    //间隔两秒时间
    _timer = new Timer.periodic(Duration(milliseconds: 2000), (value) {
      print("定时器");
      currentIndex++;
      //触发轮播切换
      _pageController.animateToPage(currentIndex,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
      //刷新
      setState(() {});
    });
  }

  //使用层叠布局将图片与自定义的指示器组装在一起
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      child: Stack(
        children: [
          //第一部分 轮播图片
          buildBannerWidget(),
          //第二部分 指示器
          buildTipsWidget(),
        ],
      ),
    );
  }

  //第一部分的实现 PageView来装载图片
  buildBannerWidget() {
    //懒加载方式构建
    return PageView.builder(
      //构建每一个子Item的布局
      itemBuilder: (BuildContext context, int index) {
        return buildPageViewItemWidget(index);
      },
      //控制器
      controller: _pageController,
      //轮播个数 无限轮播 ??
      itemCount: imageList.length * 10000,
      //PageView滑动时回调
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  //轮播显示图片
  Widget buildPageViewItemWidget(int index) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: Image.asset(
          imageList[index % imageList.length],
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  //第二部分的实现 指示器
  Widget buildTipsWidget() {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(Container(
        width: 4, height: 4,
        margin: EdgeInsets.only(left: 4),
        //圆角边框
        decoration: BoxDecoration(
            //背景
            color: currentIndex == i ? Colors.red : Colors.white,
            //边框圆角
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ));
    }
    return Positioned(
      bottom: 20,
      left: 0,right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }
}
