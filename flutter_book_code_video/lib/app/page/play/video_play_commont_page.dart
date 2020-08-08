import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/play/video_play_commont_page.dart
/// 评论列表
class VideoCommontPage extends StatefulWidget {
  ///绑定的视频数据
  final VideoModel videoModel;
  const VideoCommontPage({Key key,@required this.videoModel}) : super(key: key);
  @override
  _VideoCommontPageState createState() => _VideoCommontPageState();
}

class _VideoCommontPageState extends State<VideoCommontPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      ///弹框的高度
      height: 390,
      ///背景颜色
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: 12,),
          ///构建标题与关闭按钮
          buildHeadStack(context),
          ///标题区域与内容列表间距
          SizedBox(height: 12,),
          ///填充布局
          Expanded(
            child: Container(
              ///构建评论列表
              child: ListView.builder(
                ///模拟100条数据
                  itemCount: 100,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCommentItemWidget();
                  }),
            ),
          ),
        ],
      ),
    );
  }
  /// lib/app/page/play/video_play_commont_page.dart
  ///标题与关闭按钮
  Stack buildHeadStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///居中
        Align(
          alignment: Alignment(0, 0),
          child: Text(
            "评论区",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        ///居右
        Align(
          alignment: Alignment(1, 0),
          ///点击关闭弹框
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.clear,
                size: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
  /// lib/app/page/play/video_play_commont_page.dart
  /// 通过线性布局组合到一起的评论内容
  Widget buildCommentItemWidget() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      ///通过Row组合左侧的图片头像
      ///与右侧的文字内容
      child: Row(
        ///左上角对齐
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///左侧的图片
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Image.asset(
              "assets/images/2.0x/wexin_icon.png",
              width: 33, height: 33,
            ),
          ),
          ///右侧的文字内容区域
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "@早起的年轻人",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "时间是一切财富中最宝贵的财富，成功的秘诀，在永不改变既定的目的！！！",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.only(left: 6, right: 6),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: Text(
                    "6小时前",
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}