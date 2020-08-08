import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1530.dart
/// DraggableScrollableSheet分析使用
class DraggableScrollableSheetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          title: Text("抽屉详情"),
        ),

        ///构建列表显示数据
        ///滚轮效果的
        body: Stack(
          children: [
            ///其他组件的内容区域
            ///
            ///上拉抽屉效果
            DraggableScrollableSheet(
              ///初始化显示抽屉的高度比例
              initialChildSize: 0.11,
              ///抽屉允许的最小高度比例
              minChildSize: 0.1,
              ///抽屉拖动允许的最大高度比例
              maxChildSize: 0.4,
              ///构建抽屉中的内容
              builder:
                  (BuildContext context, ScrollController scrollController) {
                ///构建一个圆角的边框
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      ///只上部分的圆角
                      borderRadius: BorderRadius.only(
                        ///左上角
                          topLeft: Radius.circular(12),
                          ///右上角
                          topRight: Radius.circular(12),),),
                  ///可滑动的Widget 这里构建的是一个
                  ///ListView
                  child: buildListView(scrollController),
                );
              },
            )
          ],
        ));
  }


  ///lib/code15/main_data1530.dart
  ///可滑动布局构建
  buildListView(ScrollController scrollController) {
    return ListView.builder(
      ///需要注意的是这里的控制器需要使用
      ///builder函数中回调中的 控制器
      controller: scrollController,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text('测试数据 $index'));
      },
    );
  }
}
