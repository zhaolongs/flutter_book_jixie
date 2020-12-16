import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/page/home/play/find_video_page.dart';
import 'package:flutter_video/src/page/home/play/video_play_detailed_page.dart';
import 'package:flutter_video/src/utils/log_util.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
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
      margin: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    width: 24,
                    height: 24,
                    color: Colors.grey,
                    //加载头像
                    child: CachedNetworkImage(
                      imageUrl: widget.videoModel.videoImag,
                      placeholder: (context, url) {
                        return CircularProgressIndicator();
                      },
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
                SizedBox(
                  width: 8,
                ),
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
          ),
          Container(
            margin: EdgeInsets.only(left: 12, right: 12, bottom: 0),
            child: Text(
              widget.videoModel.videoName,
              style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: VideoPlayDetailed(
              streamController: widget.streamController,
              videoModel: widget.videoModel,
              isScroll: widget.isScroll,
            ),
          )
        ],
      ),
    );
  }
}
