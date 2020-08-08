import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';
import 'package:flutterbookcode/app/page/play/play_list_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/6/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/mine/mine_item_page.dart
/// 我的页面对应的九宫格视频数据
class MineItemPage extends StatefulWidget {
  ///页面对应的标识 用来加载不同类别的数据
  final int pageIndex;
  MineItemPage(this.pageIndex);

  @override
  _MineItemPageState createState() => _MineItemPageState();
}

class _MineItemPageState extends State<MineItemPage>
    with AutomaticKeepAliveClientMixin {

  ///页面保持状态
  @override
  bool get wantKeepAlive => true;
  ///保存视频数据的集合
  List<VideoModel> videoList = [];
  ///在这里可以异步开启一个网络请求去加载对应的网络数据
  @override
  void initState() {
    super.initState();

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
      videoModel.videoImag = "assets/images/2.0x/video_ placeholder.webp";
      videoModel.videoUrl = "http://pic.studyyoun.com/1583058399368141.mp4";

      videoList.add(videoModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.all(0),
      child: GridView.builder(
          padding: EdgeInsets.all(1.0),
          cacheExtent: 0,
          itemCount: videoList.length,
          //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
              crossAxisCount: 3,
              //纵轴间距
              mainAxisSpacing: 1.0,
              //横轴间距
              crossAxisSpacing: 1.0,
              //子组件宽高长度比例
              childAspectRatio: 0.8),
          itemBuilder: (BuildContext context, int index) {
            //构建子条目对应的Widget
            return buildOpenContainer(index);
          }),
    );
  }

  ///通过[OpenContainer]实现动画过渡的方式打开视频对应的视频播放页面
  OpenContainer<Object> buildOpenContainer(int index) {
    ///对应的视频数据
    VideoModel videoModel = videoList[index];
    return OpenContainer(
      ///打开页面的过渡时间
      transitionDuration: Duration(milliseconds: 800),
      ///当前显示的视图
      closedBuilder: (BuildContext context, void Function() action) {
        return Container(
          child: Stack(children: [
            Positioned(
              left: 0, right: 0, bottom: 0, top: 0,
              child: Image.asset(
                videoModel.videoImag, fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 10, bottom: 10,
              child: Row(
                children: [
                  Icon(Icons.play_circle_outline, size: 20,),
                  SizedBox(width: 4,),
                  Text("33"),
                ],
              ),
            )
          ]),
        );
      },
      ///点击动态打开的页面
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return PlayListPage(
          list: videoList,
          initIndex: index,
        );
      },
    );
  }


}
