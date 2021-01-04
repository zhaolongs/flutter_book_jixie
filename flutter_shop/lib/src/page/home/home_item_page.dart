import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/common/home_value_event.dart';
import 'package:flutter_shop/src/utils/log_util.dart';

import 'home_item_scroll_page.dart';
import 'image_text_widget.dart';

///代码清单 12-19
///首页面视频播放页面
///lib/src/page/home/home_item_page.dart
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  StreamController<double> _streamController = StreamController.broadcast();

  @override
  void initState() {
    super.initState();

    _streamController.stream.listen((double pixels) {
      if (pixels <= 44) {
        _value = pixels / 44.0;
        setState(() {});
      } else if (pixels > 44 && pixels <= 88) {
        _value2 = (pixels - 44) / 44.0;
        setState(() {});
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //状态文字设置为魄
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    //设置状态栏的颜色 有AppBar时，会被覆盖
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: buildScaffold(),
      value: SystemUiOverlayStyle(
          //状态栏的背景红色 Android 8.0 以上手机设置方法
          statusBarColor: Colors.red,
          //状态栏文字颜色为白色 Android 6.0 以上手机起作用
          statusBarIconBrightness: Brightness.light,
          //底部navigationBar背景颜色 Android 6.0 以上手机起作用
          systemNavigationBarColor: Colors.white),
    );
  }

  double _value = 0.0;
  double _value2 = 0.0;

  ///代码清单 12-21
  ///首页面的主体内容
  ///lib/src/page/home/home_item_page.dart
  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.red,
      //层叠布局
      body: Stack(
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
                  Expanded(child: Text("早起的年轻人")),
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
                44 * (1.0 - _value2),
            right: 0,
            height: 38,
            left: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(right: 20 * _value),
                  height: 34,
                  width: MediaQuery.of(context).size.width - 20 - 120 * _value,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/2.0x/search_icon2.png',
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text("搜索"),
                      ),
                      Image.asset(
                        'assets/images/2.0x/camera_icon2.png',
                        width: 22,
                        height: 22,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 80,
            right: 0,
            bottom: 0,
            left: 0,
            child: HomeItmeScrollPage(_streamController),
          )
        ],
      ),
    );
  }

  notificationFunction(ScrollNotification notification) {
    //滑动信息的数据封装体
    ScrollMetrics metrics = notification.metrics;
    AxisDirection axisDirection = metrics.axisDirection;
    //当前位置
    double pixels = metrics.pixels;
    if (axisDirection == AxisDirection.down) {
      print("当前位置 $pixels axisDirection $axisDirection");

      if (pixels <= 44) {
        _value = pixels / 44.0;
        setState(() {});
      } else if (pixels > 44 && pixels <= 88) {
        _value2 = (pixels - 44) / 44.0;
        setState(() {});
      }
    }
    return false;
  }
}
