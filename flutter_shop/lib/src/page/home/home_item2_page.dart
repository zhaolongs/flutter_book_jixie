import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/common/home_value_event.dart';
import 'package:flutter_shop/src/utils/log_util.dart';

import 'home_item_scroll_page.dart';
import 'image_text_widget.dart';

///代码清单 12-19
///首页面视频播放页面
///lib/src/page/home/home_item_catalogue_page.dart
class HomeItemMainPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeItemState();
  }
}

StreamController<double> _streamController = StreamController.broadcast();

///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class _HomeItemState extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

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

  buildScaffold() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [];
      },
      body: HomeItmeScrollPage(),
    );
  }
}
