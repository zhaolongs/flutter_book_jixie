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
///
/// bili https://space.bilibili.com/513480210
///
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
///
/// 西瓜视频 https://www.ixigua.com/home/3662978423
//
//

void main() {
  //启动根目录
  runApp(MaterialApp(
    home: Example625(),
  ));
}

/// 代码清单 6-33 容器过渡动画
/// lib/code/code6/example_625_OpenContainer.dart
class Example625 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenContainer过渡"),
      ),
      backgroundColor: Colors.grey[200],
      //列表
      body: ListView.builder(
        //构建每个列表的显示的Widget
        itemBuilder: (BuildContext context, int index) {
          //构建每个列表子Item的布局
          return buildOpenContainer(index);
        },
        //列表子Item个数
        itemCount: 10,
      ),
    );
  }

  /// 代码清单 6-34 OpenContainer 核心
  /// lib/code/code6/example_625_OpenContainer.dart
  Widget buildOpenContainer(int index) {
    //容器转换路由
    return OpenContainer(
      //过渡的动画类型
      transitionType: ContainerTransitionType.fade,
      //过渡时间
      transitionDuration: Duration(milliseconds: 3000),
      //closedBuilder配置的Widget的背景色
      closedColor: Colors.white,
      //阴影高度
      closedElevation: 2,
      //边框样式
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //默认显示的Widget
      closedBuilder: (BuildContext context, void Function() action) {
        //每个子Item当前显示的UI布局
        //在这里设置显示的一张图片
        return Image.asset(
          "assets/images/2.0x/banner2.webp",
          fit: BoxFit.fill,
        );
      },

      //点击打开的页面
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        //一般是一个详情页面
        return DetailsPage();
      },

      //openBuilder配置的Widget的背景色
      openColor: Colors.blue,
      openElevation: 1.0,
      openShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),

      //从第二个页面中返回时的回调
      //参数 value就是上一个页面回传的参数
      onClosed: (value) {
        print("onClosed $value");
      },
    );
  }
}

/// 代码清单 6-35 一个展示图片的详情页面
/// lib/code/code6/example_625_OpenContainer.dart
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              "assets/images/2.0x/banner2.webp",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
