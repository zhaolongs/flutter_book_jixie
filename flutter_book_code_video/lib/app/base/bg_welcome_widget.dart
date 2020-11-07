import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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