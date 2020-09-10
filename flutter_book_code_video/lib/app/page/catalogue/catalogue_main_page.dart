import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/app/page/catalogue/catalogue_main_page.dart
///目录主页面
class CatalogueMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogueMainPageState();
  }
}

class _CatalogueMainPageState extends State<CatalogueMainPage>  with AutomaticKeepAliveClientMixin{
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
    return Scaffold(
      appBar: AppBar(
        title: Text("目录"),
      ),
      body: Container(
          width: double.infinity,
          child: Stack(
            children: [

            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
