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
import 'package:flutter_video/src/net/dio_utils.dart';
import 'package:flutter_video/src/page/common/common_loading_dialog.dart';
import 'package:flutter_video/src/page/common/common_nodata_widget.dart';
import 'package:flutter_video/src/utils/log_util.dart';

import 'find_video_page.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/7/23.
//
// 可关注公众号：我的大前端生涯   获取最新技术分享
// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
// 可关注博客：https://blog.csdn.net/zl18603543572

///代码清单 12-24 视频列表
/// lib/src/page/home/play/play_list_page.dart

class PlayListPage extends StatefulWidget {
  //页面的标识
  final int pageIndex;

  PlayListPage({this.pageIndex = 0, Key key}) : super(key: key);

  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  //列表数据
  List<VideoModel> _list = [];

  //PageView控制器
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    //创建的模拟数据
    for (int i = 0; i < 10; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoUrl = "assets/video/list_item.mp4";
      _list.add(videoModel);
    }
    _loadingStatues = LoadingStatues.loading;
    //创建PageView的控制器
    _pageController = new PageController(initialPage: 0);

    //加载网络数据
    // refresh();
  }

  ///代码清单 12-25 页面主主体
  /// lib/src/page/home/play/play_list_page.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      //页面主体内容
      body: RefreshIndicator(
        //可滚动组件在滚动时会发送ScrollNotification类型的通知
        //[ScrollNotification]消息通知
        notificationPredicate: notificationCallBack,
        //下拉刷新回调方法
        onRefresh: () async {
          //下拉刷新加载数据
          await refresh();
          //返回值以结束刷新
          return Future.value(true);
        },
        //页面的主体内容
        //是一个 PageView
        child: buildMainBody(),
      ),
    );
  }

  ///代码清单 12-26 页面多状态显示
  /// lib/src/page/home/play/play_list_page.dart
  //默认为加载中
  LoadingStatues _loadingStatues = LoadingStatues.loading;

  Widget buildMainBody() {
    //无数据时页面显示加载中
    Widget itemWidget = Center(
      child: NoDataWidget(
        textColor: Colors.white,
        clickCallBack: () {
          //点击重新加载回调
          loadingMore();
        },
      ),
    );
    if (_loadingStatues == LoadingStatues.loading) {
      //显示加载中
      itemWidget = Center(
        child: LoadingWidget(),
      );
    } else if (_list.length > 0) {
      //显示正常的数据
      itemWidget = buildPageView();
    }
    return itemWidget;
  }

  ///代码清单 12-27 PageView 构建上下切换的视图功能
  /// lib/src/page/home/play/play_list_page.dart
  PageView buildPageView() {
    //懶加载方式构建
    return PageView.builder(
      //控制器
      controller: _pageController,
      // pageview中 子条目的个数
      itemCount: _list.length,
      //滑动回调
      onPageChanged: (value) {
        if (value >= _list.length - 1) {
          //触发加载更多
          loadingMore();
        }
      },
      //上下滑动
      scrollDirection: Axis.vertical,
      //子Item构建器
      itemBuilder: (BuildContext context, int index) {
        //对应的数据模型
        VideoModel videoModel = _list[index];
        //视频播放详情
        return FindVideoItemPage(
          videoModel: videoModel,
        );
      },
    );
  }

  //[RefreshIndicator]的滚动消息监听处理
  //用来实现加载下一页数据的功能
  bool notificationCallBack(ScrollNotification notification) {
    //该属性包含当前ViewPort及滚动位置等信息
    ScrollMetrics scrollMetrics = notification.metrics;
    //PageView可滑动的最大距离
    double maxScrollExtent = scrollMetrics.maxScrollExtent;
    //当前滑动到的位置
    double currentScrollPiexes = scrollMetrics.pixels;
    //滑动到倒数第二屏的位置
    double loadMoreScrollFlag =
        maxScrollExtent - MediaQuery.of(context).size.height;
    LogUtil.e("滑动当前的位置 $currentScrollPiexes 倒数第二屏的位置 $loadMoreScrollFlag");
    //当滑动到倒数第二屏时触发加载下一页数据的功能
    if (scrollMetrics.pixels >= loadMoreScrollFlag) {
      setState(() {});
      //加载下一页数据
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
      videoModel.videoUrl = "http://pic.studyyoun.com/1583058399368141.mp4";
      _list.add(videoModel);
    }
  }

  ///分页加载
  int _pageIndex = 1;

  ///下拉刷新
  Future<bool> refresh() async {
    _pageIndex = 1;
    return loadingData();
  }

  ///上拉加载更多
  void loadingMore() {
    _pageIndex++;
    loadingData();
  }

  Future<bool> loadingData() async {
    //Get请求
    // ResponseInfo responseInfo = await DioUtils.instance.getRequest(
    //   //请求地址
    //   url: HttpHelper.Video_LIST_URL,
    //   //Get请求参数
    //   queryParameters: {
    //     "pageIndex": _pageIndex,
    //     "pageSize": 30,
    //   },
    // );
    //本地模拟测试数据
    ResponseInfo responseInfo =
        await Future.delayed(Duration(milliseconds: 1000), () {
      //构建模拟数据
      List _list = [];
      for (int i = 0; i < 30; i++) {
        Map<String, dynamic> map = new Map();
        map['videoUrl'] = "assets/video/list_item.mp4";
        map['videoImag'] = "assets/images/banner_mang.png";
        map['videoName'] = "早起的年轻人 匠心之作$_pageIndex";
        _list.add(map);
      }

      return ResponseInfo(success: true, data: _list);
    });
    //请求成功
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

        if (_pageIndex == 1) {
          _list = itemList;
        } else {
          _list.addAll(itemList);
        }
        setState(() {});
      }
    } else {
      setState(() {});
    }

    return true;
  }
}
