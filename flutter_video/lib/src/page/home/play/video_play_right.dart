import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';

import 'video_play_commont_page.dart';
import 'video_play_share_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///代码清单 12-30
///底部的视频说明区域
///lib/src/page/home/play/video_play_right.dart
class VideoPlayRightPage extends StatefulWidget {
  final VideoModel videoModel;

  VideoPlayRightPage({this.videoModel});

  @override
  _VideoPlayRightPageState createState() => _VideoPlayRightPageState();
}

class _VideoPlayRightPageState extends State<VideoPlayRightPage> {
  @override
  Widget build(BuildContext context) {
    ///限定宽度
    return Container(
      width: 60,
      child: Column(
        ///子组件居中
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ///用户的信息
          buildUserItem(),

          ///喜欢
          buildLikeWidget(
              assetImage: widget.videoModel.isLike
                  ? "assets/images/2.0x/like_icon_2.png"
                  : "assets/images/2.0x/like_icon.png",
              msgCount: 232,
              callBack: () {}),

          ///评论
          buildLikeWidget(
              assetImage: "assets/images/2.0x/comment_icon.png",
              msgCount: 22,
              callBack: () {
                showBottomFoncton(1);
              }),

          ///转发
          buildLikeWidget(
              assetImage: "assets/images/2.0x/transpond_icon.png",
              msgCount: 32,
              callBack: () {
                showBottomFoncton(2);
              }),
        ],
      ),
    );
  }

  ///代码清单 12-31
  ///构建用户的头像区域
  ///lib/src/page/home/play/video_play_right.dart
  Widget buildUserItem() {
    return Container(
      width: 60,
      height: 60,
      child: Stack(
        children: <Widget>[
          Align(
            //居中
            alignment: Alignment(0, 0),
            //裁剪成圆形的头像
            child: ClipOval(
              child: Container(
                width: 44, height: 44,
                color: Colors.grey,
                //加载头像
                child: CachedNetworkImage(
                  imageUrl: widget.videoModel.videoImag,
                  //加载中占位
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (
                    BuildContext context,
                    String url,
                    dynamic error,
                  ) {
                    return Image.asset(
                      "assets/images/2.0x/app_icon.png",
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            ),
          ),

          ///是否关注
          widget.videoModel.isAttention
              ? Container()
              : Align(
                  alignment: Alignment(0, 1),

                  ///未关注下再显示一个小+号
                  child: Container(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                )
        ],
      ),
    );
  }

  ///代码清单 12-32
  ///构建用户的头像区域
  ///lib/src/page/home/play/video_play_right.dart
  ///[assetImage]图标名称
  ///[msgCount]对应的消息个数
  ///[callBack]点击回调
  buildLikeWidget({String assetImage, int msgCount, callBack}) {
    return InkWell(
      onTap: callBack,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          //线性布局包裹子Widget
          mainAxisSize: MainAxisSize.min,
          //居中对齐
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //图标
            Image.asset(assetImage, width: 33, height: 33),
            //图标与文字之间的间隔
            SizedBox(height: 4),
            Text(
              "$msgCount",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  ///代码清单 12-33
  ///lib/src/page/home/play/video_play_right.dart
  ///用来底部弹框
  ///[index]值为1 显示底部评论列表的弹框
  ///       值为2 显示底部分享的宫格的弹框
  void showBottomFoncton(int index) {
    ///显示底部弹框
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (index == 1) {
          //构建列表的弹框
          return VideoCommontPage(videoModel: widget.videoModel);
        } else {
          //构建窃宫格的分享弹框
          return SharePage(
            videoModel: widget.videoModel,
          );
        }
      },
    );
  }
}
