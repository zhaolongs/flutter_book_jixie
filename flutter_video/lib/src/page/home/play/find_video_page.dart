import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';

import 'video_play_bottom.dart';
import 'video_play_detailed_page.dart';
import 'video_play_right.dart';

//lib/app/page/play/find_video_page.dart
//播放视频的页面
class FindVideoItemPage extends StatefulWidget {
  //视频数据模型
  final VideoModel videoModel;

  const FindVideoItemPage({
    Key key,
    @required this.videoModel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FindVideoItemPageState();
  }
}

class _FindVideoItemPageState extends State<FindVideoItemPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //播放视频
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: VideoPlayDetailed(videoModel: widget.videoModel),
        ),

        //底部区域的视频介绍
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: VideoPlayBottomPage(videoModel: widget.videoModel),
        ),

        //右侧的用户信息按钮区域
        Positioned(
          right: 10,
          bottom: 00,
          top: 0,
          child: VideoPlayRightPage(videoModel: widget.videoModel),
        )
      ],
    );
  }
}
