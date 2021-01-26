
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
///
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
///
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example635(),
  ));
}

class Example635 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画在路由中的应用"),
      ),
      backgroundColor: Colors.grey[300],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 80),
        child: Column(
          children: [
            ElevatedButton(
              child: Text("透明方式打开页面"),
              onPressed: () {
                fadeOpenPageFunction(DetailsPage());
              },
            ),
            ElevatedButton(
              child: Text("滑动了"),
              onPressed: () {
                fadeOpenPageFunction2(DetailsPage());
              },
            ),
            ElevatedButton(
              child: Text("透明方式打开页面"),
              onPressed: () {
                fadeOpenPageFunction3(DetailsPage());
              },
            )
          ],
        ),
      ),
    );
  }

  ///代码清单 6-50 动态跌由打开新的显示页面的方式
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  void openPageFunction(Widget page) {
    //Material Design 风格的路由方式
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));

    //苹果风格的路由方式
    Navigator.of(context)
        .push(CupertinoPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  ///代码清单 6-51 透明渐变方式过渡
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  void fadeOpenPageFunction(Widget page) {
    Navigator.of(context).push(
      //自定义路由
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return page;
        },
        //动画构建
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          //透明过渡
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  ///代码清单 6-52 从上向下滑动进入 然后从左向右滑出
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  void fadeOpenPageFunction2(Widget page) {
    Navigator.of(context).push(
      //自定义路由
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return page;
        },
        //时间
        transitionDuration: Duration(milliseconds: 1000),
        //动画构建
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          //进入时从上向下
          Offset startOffset = Offset(0.0, -1.0);
          Offset endOffset = Offset(0.0, 0.0);
          //退出时从左向右
          if (animation.status == AnimationStatus.reverse) {
            //相反执行，所以这里也需要相对定义
            startOffset = Offset(1.0, 0.0);
            endOffset = Offset(0.0, 0.0);
          }
          //滑动过渡  跳动
          return SlideTransition(
            position: Tween<Offset>(begin: startOffset, end: endOffset).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.bounceInOut,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }

  ///代码清单 6-53 透明渐变方式过渡
  ///lib/code/code6/example_634_WelcomeAnimation.dart
  void fadeOpenPageFunction3(Widget page) {
    Navigator.of(context).push(
      //自定义路由
      PageRouteBuilder<void>(
        //背景透明方式打开
        opaque: false,
        //打开页面的过渡时间
        transitionDuration: Duration(milliseconds: 500),
        //退出页面的过渡时间
        reverseTransitionDuration: Duration(milliseconds: 800),
        //页面构建
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              //透明度
              return Opacity(
                //Interval 用于时间延迟控制
                opacity: Interval(0.0, 0.75, curve: Curves.fastOutSlowIn)
                    .transform(animation.value),
                child: page,
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("第二个页面"),
      ),
    );
  }
}
