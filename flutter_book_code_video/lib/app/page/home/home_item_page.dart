import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';
import 'package:flutterbookcode/app/page/play/play_list_page.dart';

///lib/app/page/home/home_item_page.dart
///首页面显示的视频列表播放页面
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}
///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class MainFindPage3State extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;

  ///[TabBar]使用的文本
  List<String> tabTextList = ["关注", "推荐"];
  ///[TabBar]使用的[Tab]集合
  List<Tab> tabWidgetList = [];
  ///[TabBar]的控制器
  TabController tabController;

  ///推荐模拟数据
  List<VideoModel> videoList = [];
  ///关注模拟数据
  List<VideoModel> videoList2 = [];

  void buildTestData(){

    ///创建模拟数据

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

      videoList.add(videoModel);
    }

    for (int i = 0; i < 3; i++) {
      VideoModel videoModel = new VideoModel();
      videoModel.videoName = "关注测试数据$i";
      videoModel.pariseCount = i * 22;
      videoModel.isAttention = true;
      if (i % 3 == 0) {
        videoModel.isLike = true;
      } else {
        videoModel.isLike = false;
      }
      videoModel.videoImag =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1582996017736&di=101751f6d5b16e03d501001ca62633d4&imgtype=0&src=http%3A%2F%2Fupload.idcquan.com%2F2018%2F0125%2F1516851762394.jpg";
      videoModel.videoUrl =
      "http://pic.studyyoun.com/MaterialApp%E7%BB%84%E4%BB%B6%E7%9A%84%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8.mp4";

      videoList2.add(videoModel);
    }
  }

  @override
  void initState() {
    super.initState();

    ///构建TabBar中使用的Tab数据
    for (var value in tabTextList) {
      tabWidgetList.add(Tab(
        text: "$value",
      ));
    }
    ///创建TabBar使用的控制器
    tabController = new TabController(length: tabTextList.length, vsync: this);

    buildTestData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      ///层叠布局
      body: Stack(
        children: <Widget>[
          ///视频列表
          Positioned(
            left: 0, right: 0, top: 0, bottom: 0,
            child: buildTableViewWidget(),
          ),
          ///顶部选项卡
          Positioned(
            left: 0, right: 0, bottom: 0, top: 54,
            child: buildTabBarWidget(),
          ),
        ],
      ),
    );
  }

   ///视频列表
  ///构建 TabBarView
  buildTableViewWidget() {
    return TabBarView(
      controller: tabController,
      children:[
        PlayListPage(
          list:videoList,
          initIndex: 0,
        ),
        PlayListPage(
          list: videoList2,
          initIndex: 0,
        )
      ]
    );
  }

  ///构建顶部标签部分
  buildTabBarWidget() {
    return Container(
      ///对齐在顶部中间
      alignment: Alignment.topCenter,
      child: TabBar(
        controller: tabController,
        tabs: tabWidgetList,
        ///指示器的颜色
        indicatorColor: Colors.white,
        ///指示器的高度
        indicatorWeight: 2.0,
        isScrollable: true,
        ///指示器的宽度与文字对齐
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

}
