import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/net/dio_utils.dart';

import 'play/play_list_page.dart';

//lib/src/page/home/home_item_page.dart
//首页面显示的视频列表播放页面
//首页面显示的视频列表播放页面
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}

//使用到[TabBar] 所以要绑定一个Ticker
//当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class MainFindPage3State extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  //页面保持状态
  @override
  bool get wantKeepAlive => true;

  //[TabBar]使用的文本
  List<String> tabTextList = ["关注", "推荐"];

  //[TabBar]使用的[Tab]集合
  List<Tab> tabWidgetList = [];

  //[TabBar]的控制器
  TabController tabController;

  //推荐模拟数据
  List<VideoModel> videoList = [];

  //关注模拟数据
  List<VideoModel> videoList2 = [];

  @override
  void initState() {
    super.initState();

    //构建TabBar中使用的Tab数据
    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }

    //创建TabBar使用的控制器
    tabController = new TabController(length: tabTextList.length, vsync: this);

    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      //层叠布局
      body: Stack(
        children: <Widget>[
          //视频列表
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: buildTableViewWidget(),
          ),

          //顶部选项卡
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 54,
            child: buildTabBarWidget(),
          ),
        ],
      ),
    );
  }

  //视频列表
  //构建 TabBarView
  buildTableViewWidget() {
    if(videoList.length==0){
      return Container();
    }
    return TabBarView(controller: tabController, children: [
      PlayListPage(
        list: videoList,
        initIndex: 0,
      ),
      PlayListPage(
        list: videoList2,
        initIndex: 0,
      )
    ]);
  }

  //构建顶部标签部分
  buildTabBarWidget() {
    return Container(
      //对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,
        //指示器的颜色
        indicatorColor: Colors.white,
        //指示器的高度
        indicatorWeight: 2.0,
        isScrollable: true,

        //指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  int pageIndex = 1;

  void loadingData() async {
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
          videoList2 = itemList;
        } else {
          videoList.addAll(itemList);
          videoList2.addAll(itemList);
        }
        setState(() {});
      }
    } else {
      setState(() {

      });
    }
  }
}
