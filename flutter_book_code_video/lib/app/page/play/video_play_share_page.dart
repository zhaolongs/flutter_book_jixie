import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/bean/bean_video.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/page/play/video_play_share_page.dart
/// 分享弹框内容区域
class SharePage extends StatefulWidget {
  ///绑定的数据
  final VideoModel videoModel;

  const SharePage({Key key, @required this.videoModel}) : super(key: key);

  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {


  /// lib/app/page/play/video_play_share_page.dart
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ///分享的图标区域
          buildShareIconWidget(), 
          ///分割线
          Container(height: 1, color: Colors.grey,
          ),
          ///底部的取消关闭区域
          InkWell(
            onTap: () {Navigator.pop(context);},
            child: Container(
              height: 44, alignment: Alignment.center,
              child: Text("取消"),
            ),
          )
        ],
      ),
    );
  }

  ///分享的图标区域，
  ///通过容器限定弹框的高度
  Padding buildShareIconWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        height: 190.0,
        child: buildGridView(),
      ),
    );
  }

  /// lib/app/page/play/video_play_share_page.dart
  ///分享弹框对应的图标文字说明
  List<String> nameItems = <String>['微信', '朋友圈', 'QQ', 'QQ空间', '微博', '链接'];
  //分享弹框对应的图标
  List<String> urlItems = <String>[
    'assets/images/2.0x/wexin_icon.png',
    'assets/images/2.0x/friend_icon.png',
    'assets/images/2.0x/qq_icon.png',
    'assets/images/2.0x/qq_zon_icon.png',
    'assets/images/2.0x/weibo_icon.png',
    'assets/images/2.0x/link_icon.png',
  ];
  ///通过九宫格GridView来构建图标排列
  GridView buildGridView() {
    return GridView.builder(
      ///宫格的个数
          itemCount: nameItems.length,
          ///排列代理
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            ///每一行有4个
            crossAxisCount: 4,
            ///
            mainAxisSpacing: 5.0,
            ///图标的宽高比
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            ///通过Column构建图标与文本上下排列
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Image.asset(
                    urlItems[index],
                    width: 40, height: 40,
                  ),
                ),
                Text(nameItems[index])
              ],
            );
          });
  }
}