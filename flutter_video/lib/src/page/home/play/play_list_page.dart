import 'package:flutter/cupertino.dart'
    show
        BoxConstraints,
        BuildContext,
        Column,
        ConstrainedBox,
        State,
        StatefulWidget,
        Text,
        Widget;
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/utils/log_util.dart';

import 'find_video_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/play/play_list_page.dart
/// 视频列表
class PlayListPage extends StatefulWidget {
  ///列表数据
  final List<VideoModel> list;
  ///起始的角标
  final int initIndex;
  PlayListPage({this.list, this.initIndex = 0});

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  ///列表数据
  List<VideoModel> list;
  ///当前播放列表页面的索引
  int initIndex;
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    if (widget.list != null) {
      list = widget.list;
    } else {
      list = [];
    }
    ///索引
    initIndex = widget.initIndex;
    ///创建PageView的控制器
    _pageController= new PageController(initialPage: initIndex);
  }
  /// lib/app/page/play/play_list_page.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x80343434),
      ///页面主体内容
      body: RefreshIndicator(
        ///可滚动组件在滚动时会发送ScrollNotification类型的通知
        ///[ScrollNotification]消息通知
        notificationPredicate: notificationCallBack,
        ///下拉刷新回调方法
        onRefresh: () async {
          ///模拟网络刷新 等待2秒
          await Future.delayed(Duration(milliseconds: 2000));
          ///返回值以结束刷新
          return Future.value(true);
        },
        ///页面的主体内容
        ///是一个 PageView
        child: PageView.builder(
            controller: _pageController,
            /// pageview中 子条目的个数
            itemCount: list.length,
            /// 上下滑动
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              VideoModel videoModel = list[index];
              return FindVideoItemPage(
                videoModel: videoModel,
              );
            }),
      ),
    );
  }


  /// lib/app/page/play/play_list_page.dart
  ///[RefreshIndicator]的滚动消息监听处理
  ///用来实现加载下一页数据的功能
  bool notificationCallBack(ScrollNotification notification) {
    ///该属性包含当前ViewPort及滚动位置等信息
    ScrollMetrics scrollMetrics = notification.metrics;
    ///PageView可滑动的最大距离
    double maxScrollExtent = scrollMetrics.maxScrollExtent;
    ///当前滑动到的位置
    double currentScrollPiexes = scrollMetrics.pixels;
    ///滑动到倒数第二屏的位置
    double loadMoreScrollFlag =
        maxScrollExtent - MediaQuery.of(context).size.height;
    LogUtil.e("滑动当前的位置 $currentScrollPiexes 倒数第二屏的位置 $loadMoreScrollFlag");
    ///当滑动到倒数第二屏时触发加载下一页数据的功能
    if (scrollMetrics.pixels >= loadMoreScrollFlag) {
      setState(() {});
      ///加载下一页数据
      onLoadMore();
    }
    if (scrollMetrics.minScrollExtent == 0) {
      return true;
    } else {
      return false;
    }
  }

  void onLoadMore() async {
    LogUtil.e("加载更多");
    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "推荐测试数据$i";
      videoModel.pariseCount = i * 22;
      if (i % 3 == 0) {
        videoModel.isAttention = true;
        videoModel.isLike = true;
      } else {
        videoModel.isAttention = false;
        videoModel.isLike = false;
      }
      videoModel.videoImag =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582996017736&di=101751f6d5b16e03d501001ca62633d4&imgtype=0&src=http%3A%2F%2Fupload.idcquan.com%2F2018%2F0125%2F1516851762394.jpg";
      videoModel.videoUrl = "http://pic.studyyoun.com/1583058399368141.mp4";

      list.add(videoModel);
    }
  }
}
