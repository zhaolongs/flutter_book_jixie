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

///lib/code15/main_data1501.dart
class ScrollBaseUsePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),
      ///使用滑动布局包裹页面主体内容
      body: buildSingleScrollView(),
    );
  }
  ///SingleChildScrollView 的基本使用
  Widget buildSingleScrollView(){
    ///滑动视图
    return SingleChildScrollView(
      ///超出显示内容区域的Widget
      child: buidChildWidget(),
    );
  }

  ///超出显示内容区域的Widget
  ///在实际项目开发中
  ///可能是很庞大的内容体系
  Widget buidChildWidget (){
   return  Container(
     width: 800,
     height: 800,
     color: Colors.grey,
     child: Text("这里是 SingleChildScrollView"),
   );
  }
}