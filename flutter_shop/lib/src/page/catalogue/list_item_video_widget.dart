import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_video.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 12-8 视频列表的子Item构建
///lib/src/page/catalogue/list_item_video_widget.dart
class ListItemVideoWidget extends StatefulWidget {
  final VideoModel videoModel;
  final StreamController streamController;
  final bool isScroll;
  ListItemVideoWidget(this.videoModel,
      {this.streamController, Key key, this.isScroll = false})
      : super(key: key);
  @override
  _ListItemVideoWidgetState createState() => _ListItemVideoWidgetState();
}
class _ListItemVideoWidgetState extends State<ListItemVideoWidget> {
  @override
  void initState() {
    super.initState();
    widget.streamController.stream.listen((event) {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //外边距
      margin: EdgeInsets.only(top: 8),
      child: Text("${widget.videoModel.videoName}"),
    );
  }
}
