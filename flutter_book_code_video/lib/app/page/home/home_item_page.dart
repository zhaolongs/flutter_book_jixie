import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///lib/app/page/home/home_item_page.dart
///首页面显示的视频列表播放页面
class HomeItemMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainFindPage3State();
  }
}
///使用到[TabBar] 所以要绑定一个Ticker
///当前页面被装载在[PageView]中，使用KeepAlive使用页面保持状态
class MainFindPage3State extends State
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return  Scaffold(
      ///层叠布局
      body: Stack(
        children: <Widget>[



        ],
      ),
    );
  }

}
