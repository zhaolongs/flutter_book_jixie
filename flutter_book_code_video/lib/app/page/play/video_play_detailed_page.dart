import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/base/base_life_state.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';
import 'package:flutterbookcode/app/page/play/video_play_controller_page.dart';
import 'package:video_player/video_player.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/27.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/play/video_play_detailed_page.dart
/// 播放视频
class VideoPlayDetailed extends StatefulWidget {
  final VideoModel videoModel;

  const VideoPlayDetailed({Key key, @required this.videoModel})
      : super(key: key);

  @override
  _VideoPlayDetailedState createState() => _VideoPlayDetailedState();
}

class _VideoPlayDetailedState extends BaseLifeState<VideoPlayDetailed> {
  ///创建视频播放控制 器
  VideoPlayerController videoPlayerController;
  ///控制更新视频加载初始化完成状态更新
  Future videoPlayFuture;

  @override
  void initState() {
    super.initState();
    ///初始化视频播放相关功能
    initVideoPlayer();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///FutureBuilder会依赖一个Future
    return Stack(children: [
      ///构建视频播放
        Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child:buildFutureBuilder(),),
      ///构建表层的控制播放与暂停的按钮区域
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: VideoPlayControllerPage(
          videoPlayerController: videoPlayerController,
        ),
      ),
    ]);
  }
  /// lib/app/page/play/video_play_detailed_page.dart
  ///异步加载视频
  FutureBuilder buildFutureBuilder() {
    return FutureBuilder(
      /***
       * future ,FutureBuilder 中依赖的 Future ,
       * 通常是一个异步耗时任务,如这里的 videoPlayFuture   
       * 是指向 videoPlayerController 的初始化函数initialize()，
       * 这是一个异步的耗时操作
       */
      future: videoPlayFuture,
      ///该构建器会在Future执行的不同阶段被多次调用，构建器签名如下
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        /**
         * snapshot会包含当前异步任务的状态信息及结果信息 ，
         * 比如我们可以通过snapshot.connectionState获取异步任务的状态信息、
         * 通过snapshot.hasError判断异步任务是否有错误等等
         */
        return VideoPlayFutureBuilder(snapshot);
      },
    );
  }
  /// lib/app/page/play/video_play_detailed_page.dart
  Widget VideoPlayFutureBuilder(AsyncSnapshot snapshot) {
     if (snapshot.connectionState == ConnectionState.done) {
      ///点击事件
      return InkWell(
        onTap: () {
          videoPlayerClickFunction();
        },
        ///居中
        child: Center(
          /// AspectRatio 组件用来设定子组件宽高比
          child: AspectRatio(
            ///设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
            aspectRatio: videoPlayerController.value.aspectRatio,
            ///播放视频的组件
            child: VideoPlayer(videoPlayerController),
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        ///圆形加载进度
        child: CircularProgressIndicator(),
      );
    }
  }
  /// lib/app/page/play/video_play_detailed_page.dart
  /// 视频组件的点击事件实现逻辑
  void videoPlayerClickFunction() {
    ///获取当前视频播放的信息
    VideoPlayerValue videoPlayerValue = videoPlayerController.value;
        
    ///是否初始化完成
    bool initialized = videoPlayerValue.initialized;
    ///是否正在播放
    bool isPlaying = videoPlayerValue.isPlaying;
    ///当前播放的视频的宽高比例
    double aspectRatio = videoPlayerValue.aspectRatio;
    ///当前视频是否缓存
    bool isBuffer = videoPlayerValue.isBuffering;
    ///当前视频是否循环
    bool isLoop = videoPlayerValue.isLooping;
    ///当前播放视频的总时长
    Duration totalDuration = videoPlayerValue.duration;
    ///当前播放视频的位置
    Duration currentDuration = videoPlayerValue.position;
    if (initialized) {
      /// 视频已初始化
      if (isPlaying) {
        /// 正播放 --- 暂停
        videoPlayerController.pause();
      } else {
        ///暂停 ----播放
        videoPlayerController.play();
      }
        
      setState(() {});
    } else {
      ///未初始化
      videoPlayerController.initialize().then((_) {
        videoPlayerController.play();
        setState(() {});
      });
    }
  }

  ///当前视频播放页面失去焦点时 停止播放
  ///如跳转一个详情 弹出一个浮层dialog
  @override
  void onPause() {
    super.onPause();
    videoPlayerController.pause();
  }
  ///当前视频播放页面获取焦点时的回调生命周期
  @override
  void onResumed() {
    super.onResumed();
  }

  void initVideoPlayer() {
    ///网络链接
    videoPlayerController =
        VideoPlayerController.network(widget.videoModel.videoUrl);

    ///本地链接
//    VideoPlayerController videoPlayerController2 = VideoPlayerController.asset(widget.videoModel.videoUrl);
    ///File形式的视频
//    VideoPlayerController videoPlayerController3 = VideoPlayerController.file(File(widget.videoModel.videoUrl));

    videoPlayFuture = videoPlayerController.initialize().then((_) {
      ///视频初始完成后
      ///调用播放
      videoPlayerController.play();
      setState(() {});
    });
  }
}
