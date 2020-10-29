import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
class WelcomBackgroundWidget extends StatefulWidget {
  @override
  _WelcomeBackgroundState createState() => _WelcomeBackgroundState();
}

//lib/code/main_data.dart
class _WelcomeBackgroundState extends State<WelcomBackgroundWidget> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///构建背景
        buildBgWidget(),
        ///构建高斯模糊层
        buildBlurBg(),
      ],
    );
  }
//lib/code10/main_data1104.dart
  ///构建填充页面的背景图片
  buildBgWidget() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Image.asset(
        "assets/images/2.0x/bg_kyzg_login2.png",
        fit: BoxFit.fill,
      ),
    );
  }

  ///构建透明遮罩图层
  buildBlurBg() {
    return Container(
      color: Color.fromARGB(
        155,
        100,
        100,
        100,
      ),
    );
  }

}