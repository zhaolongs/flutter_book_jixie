import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/src/bean/bean_video.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class VideoPlayBottomPage extends StatefulWidget {
  final VideoModel videoModel;

  const VideoPlayBottomPage({Key key, this.videoModel}) : super(key: key);

  @override
  _VideoPlayBottomPageState createState() => _VideoPlayBottomPageState();
}

//lib/code/main_data.dart
class _VideoPlayBottomPageState extends State<VideoPlayBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
      color: Color(0x20666666),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "@早起的年轻人",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "三十年河东，三十年河西，看我看我看 的 哈哈？？？？？",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }
}
