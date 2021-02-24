import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
// 创建人： Created by zhaolong
// 创建时间：Created by  on 2020/9/25.
//
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example628(),
  ));
}
/// 代码清单 6-38 淡入淡出动画
/// lib/code/code6/example_627_PageTransitionSwitcher.dart
class Example628 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("淡入淡出"),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: ElevatedButton(
          child: Text("显示弹框"),
          onPressed: () {
            showBottomSheet(context);
          },
        ),
      ),
    );
  }

  //显示中间弹框的功能
  void showBottomSheet(BuildContext context) {
    //这里是核心
    showModal(
      context: context,
      //动画过渡配置
      configuration: FadeScaleTransitionConfiguration(
        //阴影背景颜色
        barrierColor: Colors.black54,
        //打开新的Widget 的时间
        transitionDuration: Duration(milliseconds: 1000),
        //关闭新的Widget 的时间
        reverseTransitionDuration: Duration(milliseconds: 1000),
      ),
      builder: (BuildContext context) {
        //显示的Widget
        return DetailsPage();
      },
    );
  }
}

/// 代码清单 6-31 弹框中显示的内容
/// lib/code/code6/example_627_PageTransitionSwitcher.dart
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //背景透明
      backgroundColor: Colors.transparent,
      body: Theme(
        data: ThemeData(
          //去除点击事件的水波纹效果
          splashColor: Colors.transparent,
          //云除点击事件的高亮效果
          highlightColor: Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            child: Center(
              child: Image.asset("assets/images/banner_mang.png"),
            ),
          ),
        ),
      ),
    );
  }
}

