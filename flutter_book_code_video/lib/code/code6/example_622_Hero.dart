import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406208.htm
/// https://blog.csdn.net/zl1
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example622(),
  ));
}

/// 代码清单 6-24 Hero 动画
///lib/code/code6/example_622_Hero.dart
class Example622 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //左上角的一个按钮
            Hero(
              //Hero动画标签
              tag: "tag1",
              child: ElevatedButton(
                // + 号图标
                child: Icon(Icons.add),
                onPressed: () {
                  //打开新的页面
                  openPage(context, "tag1");
                },
              ),
            ),
            Hero(
              //Hero动画标签
              tag: "tag3",
              child: ElevatedButton(
                // + 号图标
                child: Icon(Icons.add),
                onPressed: () {
                  //打开新的页面
                  openPage2(context, "tag3");
                },
              ),
            )
          ],
        ),
      ),
      //悬浮按钮 使用 Hero
      floatingActionButton: FloatingActionButton(
        //Hero动画标签
        heroTag: "tag2",
        child: Icon(Icons.add),
        //点击打开新的页面
        onPressed: () {
          openPage(context, "tag2");
        },
      ),
    );
  }

  void openPage(BuildContext context, String heroTag) {
    //动态方式打开
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      //目标页面 也就是这里的页面二
      return ItemDetailsPage(heroTag);
    }));
  }

  /// 代码清单 6-26 Hero 动画
  ///lib/code/code6/example_622_Hero.dart
  //透明渐变动画方式打开新的页面
  void openPage2(BuildContext context, String heroTag) {
    //动态方式打开
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面 也就是这里的页面二
          return ItemDetailsPage(heroTag);
        },
        //透明方式
        opaque: false, //动画时间
        transitionDuration: Duration(milliseconds: 800),
        //过渡动画
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          //渐变过渡动画
          return FadeTransition(
            // 透明度从 0.0-1.0
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                //动画曲线规则，这里使用的是先快后慢
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
        },
      ),
    );
  }

  ///路由工具类封装的透明渐变动画打开新的页面
  void openPage3(BuildContext context, String heroTag) {
    NavigatorUtils.openPageByFade(context, ItemDetailsPage(heroTag),
        opaque: false);
  }
}

/// 代码清单 6-25 Hero 动画 目标页面
///lib/code/code6/example_622_Hero.dart
class ItemDetailsPage extends StatelessWidget {
  String heroTag;

  ItemDetailsPage(this.heroTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面二"),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: ElevatedButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
