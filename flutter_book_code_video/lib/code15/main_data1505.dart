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

///lib/code15/main_data1505.dart
/// SingleChildScrollView
/// 结合[RefreshIndicator]下拉刷新组件使用
class ScrollBaseUsePage5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("下拉刷新"),
      ),

      ///页面布局
      body: RefreshIndicator(
        ///刷新中间带箭头小圆圈的颜色
        color: Colors.red,
        ///刷新组件背景颜色
        backgroundColor: Colors.white,
        ///刷新中间带箭头小圆圈的宽度
        strokeWidth: 4.0,
        ///下拉刷新回调方法
        onRefresh: () async {
          ///模拟网络刷新 等待2秒
          await Future.delayed(Duration(milliseconds: 2000));

          ///返回值以结束刷新
          return Future.value(true);
        },

        ///页面的主体内容
        ///使用滑动视图来实现
        child: SingleChildScrollView(
          child: buidChildWidget(),
        ),
      ),
    );
  }

  GlobalKey textGlobalKey = new GlobalKey();

  ///超出显示内容区域的Widget
  ///在实际项目开发中
  ///可能是很庞大的内容体系
  Widget buidChildWidget() {
    return Container(
      width: 800,
      height: 1800,
      alignment: Alignment.bottomCenter,
      color: Colors.grey,
      child: Text(
        "这里是 SingleChildScrollView",
        key: textGlobalKey,
      ),
    );
  }
}
