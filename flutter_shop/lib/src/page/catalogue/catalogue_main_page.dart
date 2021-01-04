import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/src/bean/bean_video.dart';
import 'package:flutter_shop/src/net/dio_utils.dart';
import 'package:flutter_shop/src/utils/log_util.dart';
import 'package:video_player/video_player.dart';

import 'list_item_video_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/

///视频列表页面
///代码清单 12-1
///lib/src/page/catalogue/catalogue_main_page.dart
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>
    with AutomaticKeepAliveClientMixin {
  //页面在PageView中保持状态
  @override
  bool get wantKeepAlive => true;



  ///代码清单 12-1
  ///lib/src/page/catalogue/catalogue_main_page.dart
  //全局唯一播放使用的Stream
  StreamController<VideoPlayerController> _streamController =
      StreamController.broadcast();

  //全局播放使用到的控制器
  VideoPlayerController _playContoller;

  @override
  void initState() {
    super.initState();
    //加载数据
    refreshData();
    //添加Stream监听
    _streamController.stream.listen((event) {
      //每次点击播放时会发通知到这里
      if (_playContoller != null &&
          event != null &&
          //textureId可理解为播放器的标识
          _playContoller.textureId != event.textureId) {
        //暂停上一个播放
        _playContoller.pause();
      }
      //记录标识
      _playContoller = event;
    });
  }

  @override
  void dispose() {
    //注销
    _streamController.close();
    super.dispose();
  }

  ///代码清单 12-2 状态样颜色相关配置
  ///lib/src/page/catalogue/catalogue_main_page.dart
  @override
  Widget build(BuildContext context) {
    super.build(context);

    //设置状态栏的颜色 有AppBar时，会被覆盖
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: buildScaffold(),
      value: SystemUiOverlayStyle(
          //状态栏的背景色
          statusBarColor: Color(0XffCDDEEC),
          //状态栏文字颜色为白色
          statusBarIconBrightness: Brightness.light,
          //底部navigationBar背景颜色
          systemNavigationBarColor: Colors.white),
    );
  }
  ///代码清单 12-3 页面脚手架
  ///lib/src/page/catalogue/catalogue_main_page.dart
  Widget buildScaffold() {
    return Scaffold(
      backgroundColor: Color(0XffCDDEEC),
      //下拉刷新组件
      body: RefreshIndicator(
        //下拉刷新方法回调
        onRefresh: () {
          //加载数据
          return refreshData();
        },
        //通知监听都
        child: NotificationListener(
          //通知回调
          onNotification: (ScrollNotification notification) {
            //滑动信息处理
            //根据不同的滑动信息来处理页面的特效
            //如Widget 移动 、放大、缩小、旋转等等
            notificationFunction(notification);

            //可滚动组件在滚动过程中会发出ScrollNotification之外，
            //还有一些其它的通知，
            //如SizeChangedLayoutNotification、
            //   KeepAliveNotification 、
            //   LayoutChangedNotification等
            //返回值类型为布尔值，当返回值为true时，阻止冒泡，
            //其父级Widget将再也收不到该通知；当返回值为false 时继续向上冒泡通知。
            return false;
          },
          child: buildListView(),
        ),
      ),
    );
  }
  ///代码清单 12-5 列表页面
  ///lib/src/page/catalogue/catalogue_main_page.dart
  Widget buildListView() {
    return ListView.builder(
      //视图缓存为0
      cacheExtent: 0,
      //列表中每个子Item的构建
      itemBuilder: (BuildContext context, int index) {
        //取出对应的数据
        VideoModel videoModel = _videoList[index];
        //每个子Item的功能单独封装
        return ListItemVideoWidget(
          //数据模型
          videoModel,
          key: ValueKey("$index"),
          //滚动停止后加载当前显示视图中的视频
          isScroll: _isScroll,
          //异步通信使用
          streamController: _streamController,
        );
      },
      itemCount: _videoList.length,
    );
  }

  ///代码清单 12-4 页面脚手架
  ///lib/src/page/catalogue/catalogue_main_page.dart
  void notificationFunction(ScrollNotification notification) {
    //滑动信息的数据封装体
    ScrollMetrics metrics = notification.metrics;
    //当前位置
    double pixels = metrics.pixels;
    double maxPixels = metrics.maxScrollExtent;
    print("当前位置 $pixels");
    //滚动类型
    Type runtimeType = notification.runtimeType;
    switch (runtimeType) {
      case ScrollStartNotification:
        print("开始滚动");
        _isScroll = true;
        break;
      case ScrollUpdateNotification:
        print("正在滚动");
        break;
      case ScrollEndNotification:
        print("滚动停止");
        setState(() {
          _isScroll = false;
        });
        //当滑动距离超出当前列表的2/3时触发加载更多
        if (pixels >= maxPixels / 3 * 2) {
          //静默加载更多
          loadingMoreData();
        }
        break;
      case OverscrollNotification:
        break;
    }
  }
  ///代码清单 12-6
  ///lib/src/page/catalogue/catalogue_main_page.dart


  //分页加载数据的页数 初始加载与下拉刷新时为1
  int pageIndex = 1;
  //滑动是否停止  true 为停止
  bool _isScroll = false;
  //是否正在加载中 true 为加载中
  bool _isLoading = false;
  //视频列表数据
  List<VideoModel> _videoList = [];

  //下拉刷新回调
  Future<bool> refreshData() async {
    if (_isLoading) {
      return false;
    }
    pageIndex = 1;
    return loadingData();
  }

  ///加载更多
  Future<bool> loadingMoreData() async {
    if (_isLoading) {
      return false;
    }
    LogUtil.e("静默加载更多");
    pageIndex++;
    return loadingData();
  }
  ///代码清单 12-7 加载视频数据方法
  ///lib/src/page/catalogue/catalogue_main_page.dart
  Future<bool> loadingData() async {
    //通过网络请求接口
    // ResponseInfo responseInfo = await DioUtils.instance
    //     .getRequest(url: HttpHelper.Video_LIST_URL, queryParameters: {
    //   "pageIndex": pageIndex,
    //   "pageSize": 30,
    // });
    //本地模拟测试数据
    ResponseInfo responseInfo =
        await Future.delayed(Duration(milliseconds: 1000), () {
          //构建模拟数据
      List _list = [];
      for (int i = 0; i < 30; i++) {
        Map<String, dynamic> map = new Map();
        map['videoUrl'] = "assets/video/list_item.mp4";
        map['videoImag'] = "assets/images/banner_mang.png";
        map['videoName'] = "早起的年轻人 匠心之作$pageIndex";
        _list.add(map);
      }

      return ResponseInfo(success: true, data: _list);
    });
    //加载成功
    if (responseInfo.success) {
      List data = responseInfo.data;
      //加载成功无数据时的处理
      if (data.length == 0) {
        if (pageIndex != 1) {
          pageIndex--;
        }
        setState(() {});
      } else {
        //加载成功有数据时的 JSON 数据解析转换
        List<VideoModel> itemList = [];
        data.forEach((element) {
          VideoModel bean = VideoModel.fromMap(element);
          itemList.add(bean);
        });
        //根据页数来设置视频数据
        if (pageIndex == 1) {
          _videoList = itemList;
        } else {
          _videoList.addAll(itemList);
        }
        //添加到队列中刷新
        Future.delayed(Duration.zero, () {
          setState(() {});
        });
      }
    } else {
      setState(() {});
    }
    _isLoading = false;
    return true;
  }
}
