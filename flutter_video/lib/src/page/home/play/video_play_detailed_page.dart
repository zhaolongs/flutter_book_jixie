import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/page/common/common_loading_dialog.dart';
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

///代码清单 12-11
/// 播放视频功能
/// lib/src/page/home/play/video_play_detailed_page.dart
class VideoPlayDetailedWidget extends StatefulWidget {
  ///视频数据
  final VideoModel videoModel;

  ///用于全局唯一视频播放控制器通信
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
  _VideoPlayDetailedWidgetState createState() =>
      _VideoPlayDetailedWidgetState();
}

class _VideoPlayDetailedWidgetState extends State<VideoPlayDetailedWidget> {
  ///代码清单 12-12
  /// 初始化设置功能
  /// lib/src/page/home/play/video_play_detailed_page.dart
  //创建视频播放控制 器
  VideoPlayerController _videoPlayerController;

  //控制更新视频加载初始化完成状态更新
  Future _videoPlayFuture;

  //是否正在播放中
  bool _isPlaying = false;



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
    //添加一个视频监听，视频播放会实时回调这个监听
    _videoPlayerController.addListener(() {
      //当前视频播放的状态
      bool isPlaying = _videoPlayerController.value.isPlaying;
      //主要用于视频停止播放后 暂停按钮再次显示出来
      if (_isPlaying && !isPlaying) {
        //更新本地变量标识
        _isPlaying = false;
        //当前视图不可用时 mounted 为 false
        if (mounted) {
          setState(() {});
        }
      }
    });

    //对视频进行初始化操作
    if (widget.isInitialize) {
      //File形式的视频
      // VideoPlayerController.file(File(url));
      _videoPlayFuture = _videoPlayerController.initialize().then((value) {
        //视频初始完成后的回调 报错时不会回调
        //调用播放
        if (widget.isAutoPlay) {
          startPlaying();
        }
      }).whenComplete(() {
        //视频加载完成后的回调 任何情况都会回调
        LogUtil.e("视频加载加载回调");
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    LogUtil.e("移除");
    super.dispose();
  }
  ///代码清单 12-14
  /// 播放视图构建
  /// lib/src/page/home/play/video_play_detailed_page.dart
  @override
  Widget build(BuildContext context) {
    //容器用来限制大小
    return Container(
      width: MediaQuery.of(context).size.width,
      //层叠布局
      child: Stack(children: [
        //第一部分 构建视频播放
        Positioned.fill(
          child: buildvideoPlay(),
        ),
        //第二部分 构建表层的控制播放与暂停的按钮区域
        Positioned.fill(
          child: buildController(),
        ),
      ]),
    );
  }
  ///代码清单 12-15
  /// 第一部分 视频播放与占位图选择
  /// lib/src/page/home/play/video_play_detailed_page.dart
  Widget buildvideoPlay() {
    //未设置加载视频 未在播放中 显示占位图
    if (!widget.isInitialize && !_isPlaying) {
      //占位图片为null 显示一个加载中
      if (StringUtils.isEmpty(widget.videoModel.videoImag)) {
        return LoadingWidget();
      } else {
        //显示占位图 一般是网络图片 这里使用的是asset资源
        return Image.asset(
          widget.videoModel.videoImag,
          fit: BoxFit.fill,
        );
      }
    } else {
      //构建视频播放
      return videoVideoPlayer();
    }
  }

  ///代码清单 12-16
  /// 第一部分 手势识别与 构建视频播放
  /// lib/src/page/home/play/video_play_detailed_page.dart
  Widget videoVideoPlayer() {
    return GestureDetector(
      onTap: () {
        //暂停视频
        _videoPlayerController.pause();
        //刷新
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

  ///代码清单 12-13
  /// 视频控制器的常用方法
  /// lib/src/page/home/play/video_play_detailed_page.dart
  void videoContterFunction() {
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
    //当前视频是否循环 自动轮播
    bool isLooping = videoPlayerValue.isLooping;

    //暂停
    _videoPlayerController.pause();
    //播放
    _videoPlayerController.play();
    //未初始化 调用初始化
    _videoPlayerController.initialize().then((_) {
      // videoPlayerController.play();
      // setState(() {});
    });
     //视频从指定的位置开始播放
    _videoPlayerController.seekTo(Duration(milliseconds: 1200));
    //设置视频不自动轮播
    _videoPlayerController.setLooping(false);
    //设置播放速度的倍数
    _videoPlayerController.setPlaybackSpeed(1);
    //设置音量 0.0~1.0
    _videoPlayerController.setVolume(1.0);
  }
  ///代码清单 12-17
  /// 第二部分
  /// lib/src/page/home/play/video_play_detailed_page.dart
  ///是否需要初始化
  bool _isClickInitialize = false;
  Widget buildController() {
    Widget itemWidget = Container();
    //当视频暂停时显示按钮
    //当前视频不在播放时显示一个三角图标
    //点击三角图标再次触发播放视频功能
    //同时隐藏这个控制区域，在点击视频时再触发暂停再显示这个控制区域
    if (_isClickInitialize) {
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
  ///代码清单 12-18
  /// 第二部分  点击播放视频的功能
  /// lib/src/page/home/play/video_play_detailed_page.dart
  void startPlaying() {
    //重复点击时
    if (_isPlaying) {
      ToastUtils.showToast("正在播放中...");
      return;
    }
    _isPlaying = true;
    if (!_videoPlayerController.value.initialized) {
      //如果视频没有初始化 点击先初始化 页面显示一个小进度圆圈
      _isClickInitialize = true;
      setState(() {});
      //调用初始化方法
      _videoPlayerController.initialize()
        //异步执行完的回调
        ..whenComplete(() {
          //初始化完成
          _isClickInitialize = false;
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
      //视频当前的播放进度
      Duration position = _videoPlayerController.value.position;
      //视频的总时长
      Duration duration = _videoPlayerController.value.duration;
      if(position==duration){
        //视频已播放完 需要重新设置进度
        _videoPlayerController.seekTo(Duration.zero);
      }
      //重新播放
      _videoPlayerController.play();
      setState(() {});
    }
  }
}
