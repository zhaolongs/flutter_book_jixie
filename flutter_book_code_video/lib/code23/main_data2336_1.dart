import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/14.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/code23/main_data2336.dart

class OpenContainerPage extends StatefulWidget {
  @override
  _FlashAnimationPageState createState() => _FlashAnimationPageState();
}

class _FlashAnimationPageState extends State<OpenContainerPage> {

  /// lib/code23/main_data2336.dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenContainer过渡"),
      ),

      body: ListView.builder(
        ///构建每个列表的显示的Widget
        itemBuilder: (BuildContext context, int index) {
          return buildOpenContainer(index);
        },
        itemCount: 10,
      ),
    );
  }

  /// lib/code23/main_data2336.dart
  /// 列表中的每个条目的Widget
  /// [index] 列表条目对应的索引
  buildContentWidget(int index) {
    ///手势事件点击跳转
    return GestureDetector(
        ///条目显示的一张图片
        child: buildShowItemContainer(),
        onTap: () {
          ///点击打开新的页面
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Item2Page();
          }));
        });
  }
  /// lib/code23/main_data2336.dart
  /// 列表中的每个条目的Widget
  /// [index] 列表条目对应的索引
  buildOpenContainerItem(int index) {
    return OpenContainer(
      ///将要打开的页面
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return Item2Page();
      },
      ///现在显示的页面
      closedBuilder: (BuildContext context, void Function() action) {
        ///条目显示的一张图片
        return buildShowItemContainer();
      },
    );
  }
  /// lib/code23/main_data2336.dart
  buildOpenContainer(int index) {
    ///容器转换路由
    return OpenContainer(
      ///过渡的动画类型
      transitionType: ContainerTransitionType.fade,
      ///过渡时间
      transitionDuration: Duration(milliseconds: 1000),
      ///closedBuilder配置的Widget的背景色
      closedColor: Colors.white,
      ///阴影高度
      closedElevation: 2,
      ///边框样式
      closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),

      ///默认显示的Widget
      closedBuilder: (BuildContext context, void Function() action) {
        ///条目显示的一张图片
        return buildShowItemContainer();
      },

      ///点击打开的页面
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return Item2Page();
      },

      ///openBuilder配置的Widget的背景色
      openColor: Colors.blue,
      openElevation: 1.0,
      openShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),

      ///从第二个页面中返回时的回调
      ///参数 value就是上一个页面回传的参数
      onClosed: (value) {
        print("onClosed $value");
      },
    );
  }

  Container buildShowItemContainer() {
    return Container(
      ///边距设置
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
      child: Image.asset(
        "assets/images/2.0x/banner4.webp",
        height: 100,
        fit: BoxFit.fill,
      ),
    );
  }
}

/// lib/code23/main_data2336.dart
class Item2Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Item2PageState();
  }
}

class _Item2PageState extends State<Item2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("页面二"),
      ),

      ///页面二中的Hero
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop(true);
        },
        child: Image.asset(
          "assets/images/2.0x/banner1.webp",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
