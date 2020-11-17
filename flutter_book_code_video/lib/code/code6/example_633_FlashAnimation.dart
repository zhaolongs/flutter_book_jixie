import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flash_animation/flash_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterbookcode/base/rating_star_widget.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// gongzhonghao biglead
// https://study.163.com/instructor/1021406208.htm
// https://blog.csdn.net/zl1
// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example633(),
  ));
}

///代码清单 6-49 [FlashAnimation] 闪光动画
///lib/code/code6/example_633_FlashAnimation.dart
class Example633 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  //闪光动画控制器
  FlashAnimationController flashAnimationController =
      new FlashAnimationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("闪光动画"),
      ),
      backgroundColor: Colors.white,
      //执行亮光动画过渡的Widget
      body: Container(
        margin: EdgeInsets.all(12),
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildContentWidget(),
            buildLoadingCart(),
          ],
        ),
      ),
      //按钮控制动画的开始与结束
      floatingActionButton: buildActionButton(),
    );
  }

  //默认动画是打开状态
  bool isOpen = true;

  // 页面的主体
  buildContentWidget() {
    return FlashAnimation.fromColors(
      //动画控制器
      flashAnimationController: flashAnimationController,
      //循环次数 默认为 0 无限循环
      animationLoopCount: 0,
      //底色
      normalColor: Colors.grey[400],
      //亮色
      highlightColor: Colors.grey[200],
      //开启动画
      animationStart: true,
      //执行动画的子Widget
      //这里是一个Widget类型，也就是可以使用任意的Widget
      //[ListPlacholderWidget]
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(3),
          ),
        ),
        height: 36,
      ),
    );
  }

  //右下角的按钮
  //按钮控制动画的开始与结束
  buildActionButton() {
    return FloatingActionButton(
      //根据不同的状态设置不同的图标
      child: Icon(isOpen ? Icons.close : Icons.open_in_browser),
      onPressed: () {
        isOpen = !isOpen;
        if (isOpen) {
          //打开动画
          flashAnimationController.start();
        } else {
          //关闭动画
          flashAnimationController.stop();
        }
      },
    );
  }

  //与闪光动画层叠的文本
  buildLoadingCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 36,
          child: Text(
            "加载中...",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
