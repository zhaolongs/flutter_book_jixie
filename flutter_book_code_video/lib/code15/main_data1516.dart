import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1516.dart
///Sliver适配器SliverToBoxAdapter
class ScrollBaseUsePage8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: new AppBar(
        title: Text("详情"),
      ),

      ///使用滑动布局包裹页面主体内容
      body: buildCustomScrollView(),
    );
  }

  ///lib/code15/main_data1516.dart
  ///构建一个 SliverToBoxAdapter
  ///加载一个 普通的 Container 容器组件
  Widget buildCustomScrollView() {
    return CustomScrollView(slivers: [

      SliverToBoxAdapter(
        child: Container(
          child: Image.asset(
            "assets/images/2.0x/banner4.webp",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
        ),
      )

    ],);
  }

}
