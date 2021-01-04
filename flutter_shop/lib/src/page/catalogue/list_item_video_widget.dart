import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/bean/bean_video.dart';
import 'package:flutter_shop/src/page/home/play/find_video_page.dart';
import 'package:flutter_shop/src/page/home/play/video_play_detailed_page.dart';
import 'package:flutter_shop/src/utils/log_util.dart';

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
  Widget build(BuildContext context) {
    return Container(
      //外边距
      margin: EdgeInsets.only(top: 8),
      //背景颜色
      color: Colors.white,
      child: Column(
        //包裹高度自适应
        mainAxisSize: MainAxisSize.min,
        //左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //第一部分 用户的基本信息
          buildUserHeader(),
          //第二部分 显示文案区域
          Container(
            //文本Text组件左对齐
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 12, right: 12, top: 6),
            child: Text(
              //通过插值方法引用 可有效避免空指针异常
              "${widget.videoModel.videoName}",
              //文本内容
              textAlign: TextAlign.start,
              //文本基本样式设置
              style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            ),
          ),
          //第三部分 视频播放与控制内容
          buildVideoContainer(context)
        ],
      ),
    );
  }
  ///代码清单 12-9 第一部分 用户的基本信息
  ///lib/src/page/catalogue/list_item_video_widget.dart
  Widget buildUserHeader() {
    return Container(
      //内边距
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 0),
      child: Row(
        //居中对齐
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //圆形头像
          ClipOval(
            child: Container(
              width: 24,
              height: 24,
              color: Colors.grey,
              //加载头像
              child: Image.asset(
                "assets/images/2.0x/app_icon.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          //填充空白
          Expanded(
            child: Text(
              "早起的年轻人",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.more_horiz_outlined)),
            onTap: () {
              LogUtil.e("点击了查看更多");
            },
          ),
        ],
      ),
    );
  }


  ///代码清单 12-10 第三部分 视频播放相关
  ///lib/src/page/catalogue/list_item_video_widget.dart
  Container buildVideoContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: 8),
      //限定视频的尺寸信息
      width: MediaQuery.of(context).size.width,
      height: 200,
      //视频播放构建
      child: VideoPlayDetailedWidget(
        streamController: widget.streamController,
        isInitialize: false,
        videoModel: widget.videoModel,
      ),
    );
  }
}
