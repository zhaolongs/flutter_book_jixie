import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/base/base_life_state.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///

/// lib/app/page/mine/mine_main_page.dart
/// 我的页面
class MineMainPage extends StatefulWidget {
  @override
  MinePageState createState() => MinePageState();
}
///[BaseLifeState]生命周期封装组件
class MinePageState extends BaseLifeState<MineMainPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  ///页面保持状态
  @override
  bool get wantKeepAlive => true;




  ///页面构建方法
  @override
  Widget build(BuildContext context) {
    super.build(context);
    ///构建页面的主体
    return Scaffold(
        body:Container());
  }


}
