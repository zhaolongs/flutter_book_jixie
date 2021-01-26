import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code/code8/example_817_ClipPath.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423

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
      backgroundColor: Color(0XffCDDEEC),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            ClipShadow(
              clipper: RoundedPathClipper(),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
                BoxShadow(
                  color: Color(0XFF748CAC).withOpacity(.6),
                  offset: Offset(5, 5),
                  spreadRadius: 1,
                  blurRadius: 15,
                ),
              ],
              child: Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(36.0)),
                  color: Color(0XffCDDEEC),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CustomIconButton(iconData: Icons.dehaze,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
