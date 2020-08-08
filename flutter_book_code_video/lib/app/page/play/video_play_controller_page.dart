import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/common_founction.dart';
import 'package:video_player/video_player.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/play/video_play_controller_page.dart
class VideoPlayControllerPage extends StatefulWidget {
  ///创建视频播放控制 器
  final VideoPlayerController videoPlayerController;
  VideoPlayControllerPage({@required this.videoPlayerController});
  @override
  _PlayControllerState createState() => _PlayControllerState();
}

class _PlayControllerState extends State<VideoPlayControllerPage> {
  @override
  Widget build(BuildContext context) {
    Widget itemWidget = Container();
    ///当视频暂停时显示按钮
    ///当前视频不在播放时显示一个三角图标
    ///点击三角图标再次触发播放视频功能
    ///同时隐藏这个控制区域，在点击视频时再触发暂停再显示这个控制区域
    if (widget.videoPlayerController.value.initialized &&
        !widget.videoPlayerController.value.isPlaying) {
      itemWidget = InkWell(
        onTap: () {
          if (!widget.videoPlayerController.value.isPlaying) {
            ///重新播放
            widget.videoPlayerController.play();
            setState(() {});
          }else{
            showCenterToast("已暂停");
          }
        },

        ///白色的圆角边框装饰
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Icon(Icons.play_arrow),
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [itemWidget],
    );
  }
}
