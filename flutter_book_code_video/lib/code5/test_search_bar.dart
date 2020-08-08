import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/search_static_bar.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/25.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

class TestSearchBarPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TestSearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("默认大小使用"),
            buildSearchBarWidget(),
            Text("指定大小使用"),
            Row(
              children: [
                Container(
                  width: 120,

                  ///这里只是用于显示的搜索框不用做输入
                  ///参数[heroTag]用于页面过渡动画tag
                  ///参数clickCallBack为当前搜索框点击事件回调
                  child: SearchStaticBar(
                    heroTag: "searchStatidBar2",
                    clickCallBack: () {
                      NavigatorUtils.pushPage(context, TestPage2());
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///lib/code5/test_search_bar.dart
  ///构建一个自适应父布局大小的搜索框
  buildSearchBarWidget() {
    return Row(
      children: [
        ///这里只是用于显示的搜索框不用做输入
        ///参数[heroTag]用于页面过渡动画tag
        ///参数clickCallBack为当前搜索框点击事件回调
        SearchStaticBar(
          ///页面过渡动画使用的heroTag标签
          heroTag: "searchStatidBar",
          ///点击事件回调
          clickCallBack: () {
            NavigatorUtils.pushPage(context, TestPage2());
          },
        )
      ],
    );
  }

  ///lib/code5/test_search_bar.dart
  ///构建一个自适应父布局大小的搜索框
  buildSearchBarWidget2() {
    return Row(
      children: [
        SizedBox(
          width: 120,
          ///这里只是用于显示的搜索框不用做输入
          ///参数[heroTag]用于页面过渡动画tag
          ///参数clickCallBack为当前搜索框点击事件回调
          child: SearchStaticBar(
            ///页面过渡动画使用的heroTag标签
            heroTag: "searchStatidBa2",
            ///点击事件回调
            clickCallBack: () {
              NavigatorUtils.pushPage(context, TestPage2());
            },
          ),
        ),
      ],
    );
  }
}

///打开的页面二
class TestPage2 extends StatefulWidget {
  @override
  _TestPageState2 createState() => _TestPageState2();
}

//lib/code/main_data.dart
class _TestPageState2 extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("页面二"),
      ),
      backgroundColor: Colors.grey,

      ///填充布局
      body: Column(
        children: [
          Hero(
            tag: "searchStatidBar",
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
            ),
          )
        ],
      ),
    );
  }
}
