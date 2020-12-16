import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/net/dio_utils.dart';
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

///lib/page/catalogue/catalogue_main_page.dart
///目录主页面
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>
    with AutomaticKeepAliveClientMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;

  //推荐模拟数据
  List<VideoModel> videoList = [];

  StreamController<VideoPlayerController> _streamController =
      StreamController.broadcast();

  VideoPlayerController _playContoller;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoUrl = "assets/video/list_item.mp4";
      videoList.add(videoModel);
    }

    _streamController.stream.listen((event) {
      if (_playContoller != null) {
        if (event != null && _playContoller.textureId != event.textureId) {
          _playContoller.pause();
        }
      }
      _playContoller = event;
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0XffCDDEEC),
      body: RefreshIndicator(
        onRefresh: () {
          pageIndex = 1;
          return loadingData();
        },
        child: NotificationListener(
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
            return true;
          },
          child: ListView.builder(
            cacheExtent: 0,
            itemBuilder: (BuildContext context, int index) {
              VideoModel videoModel = videoList[index];
              return ListItemVideoWidget(
                videoModel,
                key: ValueKey("$index"),
                isScroll: _isScroll,
                streamController: _streamController,
              );
            },
            itemCount: videoList.length,
          ),
        ),
      ),
    );
  }

  notificationFunction(ScrollNotification notification) {
    //滑动信息的数据封装体
    ScrollMetrics metrics = notification.metrics;
    //当前位置
    double pixels = metrics.pixels;
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
        break;
      case OverscrollNotification:
        break;
    }
  }

  int pageIndex = 1;
  bool _isScroll = false;

  Future<bool> loadingData() async {
    ResponseInfo responseInfo = await DioUtils.instance
        .getRequest(url: HttpHelper.Video_LIST_URL, queryParameters: {
      "pageIndex": pageIndex,
      "pageSize": 30,
    });

    if (responseInfo.success) {
      List data = responseInfo.data;
      if (data.length == 0) {
        setState(() {});
      } else {
        List<VideoModel> itemList = [];
        data.forEach((element) {
          VideoModel bean = VideoModel.fromMap(element);
          itemList.add(bean);
        });

        if (pageIndex == 1) {
          videoList = itemList;
        } else {
          videoList.addAll(itemList);
        }
        setState(() {});
      }
    } else {
      setState(() {});
    }

    return true;
  }
}
