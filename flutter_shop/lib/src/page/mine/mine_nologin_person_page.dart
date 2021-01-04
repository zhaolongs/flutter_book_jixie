import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/src/page/login/login_page.dart';
import 'package:flutter_shop/src/page/mine/settings_page.dart';
import 'package:flutter_shop/src/utils/navigator_utils.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(
            //渐变角度
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //渐变颜色组
            colors: [
              Colors.lightBlue.withOpacity(0.3),
              Colors.lightBlueAccent.withOpacity(0.3),
              Colors.blue.withOpacity(0.3),
            ],
          ),
        ),
        child: Stack(
          children: [
            //右上角的设置按钮
            buildSettings(context),
            //中间的登录按钮
            buildLoginButton(context),
          ],
        ),
      ),
    );
  }

  ///手指按下的标识
  bool _down = false;
  Center buildLoginButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        //手指按下
        onTapDown: (TapDownDetails details) {
          setState(() {_down = true;},);
        },
        //手指移出
        onTapCancel: () {
          setState(() {_down = false;},);
        },
        //手指抬起
        onTap: () {
          setState(() {_down = false;},);
          NavigatorUtils.openPageByFade(
            context,
            LoginPage(),
            mills: 1800,
            endMills: 1800,
            isBuilder: true,
          );
        },
        child: buildHero(),
      ),
    );
  }

  Widget buildHero() {
    return Hero(
      tag: "loginTag",
      child: Material(
        color: Colors.transparent,
        //阴影提高的动画
        child: buildAnimatedContainer(),
      ),
    );
  }

  //按下登录按钮时使用到的阴影
  List<BoxShadow> _shadowList = [
    BoxShadow(
        //阴影颜色
        color: Colors.black54,
        //阴影偏移量
        offset: Offset(2, 2),
        //阴影的模糊度
        blurRadius: 2,
        //模糊半径
        spreadRadius: 1),
    BoxShadow(
        color: Colors.black54,
        offset: Offset(-2, 2),
        blurRadius: 2),
  ];

  //登录按钮使用到的渐变样式
  LinearGradient _gradient = LinearGradient(
    colors: [
      Colors.deepOrange[400],
      Colors.redAccent,
      Colors.deepOrange[400],
    ],
  );

  //登录按钮的文字样式
  TextStyle _loginStyle = TextStyle(
      color: Colors.white, fontSize: 16,
      fontWeight: FontWeight.w500);

  AnimatedContainer buildAnimatedContainer() {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: 88,
      height: 88,
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        //圆角
        borderRadius: BorderRadius.all(Radius.circular(50,)),
        //渐变背景
        gradient: _gradient,
        //阴影
        boxShadow: _down ?_shadowList : null,
      ),
      child: Text(
        "登录",
        textAlign: TextAlign.center,
        style:_loginStyle,
      ),
    );
  }

  ///右上角的设置按钮
  Positioned buildSettings(BuildContext context) {
    return Positioned(
      top: 44, right: 0,
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
