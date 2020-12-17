import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/utils/log_util.dart';
import 'package:flutter_video/src/utils/string_utils.dart';
import 'package:flutter_video/src/utils/toast_utils.dart';
import 'package:video_player/video_player.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/7/27.
//
// 可关注公众号：我的大前端生涯   获取最新技术分享
// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
// 可关注博客：https://blog.csdn.net/zl18603543572

/// 播放视频功能
/// lib/src/page/home/play/video_play_detailed_page.dart
class VideoPlayDetailedWidget extends StatefulWidget {
  ///视频数据
  final VideoModel videoModel;
  final StreamController streamController;
  
  ///[isInitialize] 预加载视频
  final bool isInitialize;
  
  ///[isInitialize]为true时才起作用 
  ///[isAutoPlay] 为true 时 加载完成自动 播放
  final bool isAutoPlay;

  const VideoPlayDetailedWidget({
    Key key,
    @required this.videoModel,
    this.isAutoPlay = false,
    this.streamController,
    this.isInitialize = false,
  }) : super(key: key);

  @override
  _VideoPlayDetailedWidgetState createState() => _VideoPlayDetailedWidgetState();
}

class _VideoPlayDetailedWidgetState extends State<VideoPlayDetailedWidget>{
  //创建视频播放控制 器
  VideoPlayerController _videoPlayerController;

  //控制更新视频加载初始化完成状态更新
  Future _videoPlayFuture;
  //是否正在播放中
  bool _isPlaying = false;
  //是否需要初始化
  bool _isInitialize = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      //当前视频可用时 mounted 为true
      if (mounted) {
        //添加一个焦点监听
        FocusScope.of(context).addListener(() {
          //判断当前是否有焦点
          // 当被dialog挡住时，虽然可见，但是不可操作 为 flase 
          // 为 false时需要停止播放视频
          bool isFirstFocus = FocusScope.of(context).isFirstFocus;
          LogUtil.e("home isFirstFocus $isFirstFocus  ");
          if (!isFirstFocus) {
            _isPlaying = false;
            _videoPlayerController.pause();
          }
        });
      }
    });
    initData();
  }

  void initData() {
    //初始化视频播放相关功能
    //网络链接
    //VideoPlayerController.network(url);
    //VideoPlayerController.file(File(url));
    //本地链接
    _videoPlayerController =
        VideoPlayerController.asset(widget.videoModel.videoUrl);
    _videoPlayerController.addListener(() {
      if (_isPlaying && !_videoPlayerController.value.isPlaying && mounted) {
        _isPlaying = false;
        setState(() {});
      }
    });

    if (widget.isInitialize) {
      //File形式的视频
      // VideoPlayerController.file(File(url));
      _videoPlayFuture = _videoPlayerController.initialize().then((value) {
        //视频初始完成后
        //调用播放
        if (widget.isAutoPlay) {
          startPlaying();
        }
      }).whenComplete(() {
        LogUtil.e("视频加载加载回调");
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    LogUtil.e("移除");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //FutureBuilder会依赖一个Future
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        //构建视频播放
        Positioned.fill(
          child: buildvideoPlay(),
        ),
        //构建表层的控制播放与暂停的按钮区域
        Positioned.fill(
          child: buildController(),
        ),
      ]),
    );
  }

  Widget buildvideoPlay() {
    if (!widget.isInitialize && !_isPlaying) {
      if (StringUtils.isEmpty(widget.videoModel.videoImag)) {
        return Container();
      } else {
        return Image.asset(
          widget.videoModel.videoImag,
          fit: BoxFit.fill,
        );
      }
    } else {
      return videoPlayFutureBuilder();
    }
  }

  // lib/app/page/play/video_play_detailed_page.dart
  Widget videoPlayFutureBuilder() {
    return GestureDetector(
      onTap: () {
        //暂停视频
        _videoPlayerController.pause();
        setState(() {});
      },
      //居中
      child: Center(
        // AspectRatio 组件用来设定子组件宽高比
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            //设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
            aspectRatio: _videoPlayerController.value.aspectRatio,
            //播放视频的组件
            child: VideoPlayer(_videoPlayerController),
          ),
        ),
      ),
    );
  }

  // lib/app/page/play/video_play_detailed_page.dart
  // 视频组件的点击事件实现逻辑
  void videoPlayerClickFunction() {
    //获取当前视频播放的信息
    VideoPlayerValue videoPlayerValue = _videoPlayerController.value;

    //是否初始化完成
    bool initialized = videoPlayerValue.initialized;
    //是否正在播放
    bool isPlaying = videoPlayerValue.isPlaying;
    //当前播放的视频的宽高比例
    double aspectRatio = videoPlayerValue.aspectRatio;
    //当前视频是否缓存
    bool isBuffer = videoPlayerValue.isBuffering;
    //当前视频是否循环
    bool isLoop = videoPlayerValue.isLooping;
    //当前播放视频的总时长
    Duration totalDuration = videoPlayerValue.duration;
    //当前播放视频的位置
    Duration currentDuration = videoPlayerValue.position;
    if (initialized) {
      // 视频已初始化
      if (isPlaying) {
        // 正播放 --- 暂停
        _videoPlayerController.pause();
      } else {
        //暂停 ----播放
        _videoPlayerController.play();
      }
      setState(() {});
    } else {
      //未初始化
      _videoPlayerController.initialize().then((_) {
        // videoPlayerController.play();
        // setState(() {});
      });
    }
  }

  buildController() {
    Widget itemWidget = Container();

    //当视频暂停时显示按钮
    //当前视频不在播放时显示一个三角图标
    //点击三角图标再次触发播放视频功能
    //同时隐藏这个控制区域，在点击视频时再触发暂停再显示这个控制区域
    if (_isInitialize) {
      itemWidget = CupertinoActivityIndicator();
    } else if (!_videoPlayerController.value.isPlaying) {
      itemWidget = GestureDetector(
        onTap: () {
          startPlaying();
        },
        //白色的圆角边框装饰
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width /
              _videoPlayerController.value.aspectRatio,
          color: Colors.blueGrey.withOpacity(0.5),
          child: Icon(
            Icons.play_circle_fill_rounded,
            size: 44,
          ),
        ),
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [itemWidget],
    );
  }

  void startPlaying() {
    //重复点击时
    if (_isPlaying) {
      ToastUtils.showToast("正在播放中...");
      return;
    }
    _isPlaying = true;
    if (!_videoPlayerController.value.initialized) {
      //如果视频没有初始化 点击先初始化 页面显示一个小进度圆圈
      _isInitialize = true;
      setState(() {});
      //调用初始化方法
      _videoPlayerController.initialize()
        //异步执行完的回调
        ..whenComplete(() {
          //初始化完成
          _isInitialize = false;
          //需要再次校验
          if (_videoPlayerController.value.initialized) {
            //成功则开始播放当前的视频 同时需要停止之前的播放器
            if (widget.streamController != null) {
              widget.streamController.add(_videoPlayerController);
            }
            _videoPlayerController.play();
          } else {
            ToastUtils.showToast("加载失败 请重试");
          }
          setState(() {});
        });
    } else {
      //如果已初始化完成 直接调用播放
      if (widget.streamController != null) {
        widget.streamController.add(_videoPlayerController);
      }
      //重新播放
      _videoPlayerController.play();
      setState(() {});
    }
  }
}
