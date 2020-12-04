import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/page/bubble_login_page.dart';
import 'package:flutterbookcode/app/page/mine/settings_page.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单
class MineNoLoginPersonPage extends StatefulWidget {
  @override
  _NoLoginPersonState createState() => _NoLoginPersonState();
}

class _NoLoginPersonState extends State<MineNoLoginPersonPage> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            buildSettings(context),
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  Center buildLoginButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(
            () {
              _down = true;
            },
          );
        },
        onTapCancel: () {
          setState(
            () {
              _down = false;
            },
          );
        },
        onTap: () {
          setState(
            () {
              _down = false;
            },
          );
          NavigatorUtils.openPageByFade(context, BobbleLoginPage());
        },
        child: buildAnimatedContainer(),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer() {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: 88,
      height: 88,
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(
          50,
        )),
        gradient: LinearGradient(
          colors: [
            Colors.deepOrange[400],
            Colors.redAccent,
            Colors.deepOrange[400],
          ],
        ),
        boxShadow: _down
            ? [
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2, 2),
                    blurRadius: 2,
                    spreadRadius: 1),
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(-2, 2),
                    blurRadius: 2),
              ]
            : null,
      ),
      child: Text(
        "登录",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Positioned buildSettings(BuildContext context) {
    return Positioned(
      top: 44,
      right: 0,
      child: InkWell(
        onTap: () {
          NavigatorUtils.pushPage(
            context,
            SettingsPage(),
          );
        },
        child: Container(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}
