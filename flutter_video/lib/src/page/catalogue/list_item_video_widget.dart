import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';
import 'package:flutter_video/src/page/home/play/find_video_page.dart';
import 'package:flutter_video/src/page/home/play/video_play_detailed_page.dart';

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

  ListItemVideoWidget(this.videoModel);

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
            padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    width: 44,
                    height: 44,
                    color: Colors.grey,
                    //加载头像
                    child: CachedNetworkImage(
                      imageUrl: widget.videoModel.videoImag,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "早起的年轻人",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        widget.videoModel.createTime,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 12,right: 12,bottom: 16),
            child: Text(
              widget.videoModel.videoName,
              style: TextStyle(fontSize: 14, color: Color(0xff666666)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: VideoPlayDetailed(
              videoModel: widget.videoModel,
            ),
          )
        ],
      ),
    );
  }
}
