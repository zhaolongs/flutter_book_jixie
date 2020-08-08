import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1612.dart
class ListViewUsePage12 extends StatefulWidget {
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

      ///列表
      body: buildListView(),
    );
  }

  ///lib/code15/main_data1612.dart
  Widget buildListView(){
    return AnimationLimiter(
      child:ListView.builder(
        ///子条目个数
        itemCount: 10000,
        itemBuilder: (context,index){
          ///构建ListView的子条目
          ///通过动画控制器包裹
          return AnimationConfiguration.staggeredList(
            ///ListView对应的条目索引
            position: index,
            //滑动动画执行的时间
            duration: const Duration(milliseconds: 375),
            //滑动动画
            child: SlideAnimation( 
              ///滑动动画的偏移度
              verticalOffset: 50.0,
              ///透明度过渡动画
              child: FadeInAnimation(
                ///构建ListView具体的子条目
                child: buildListViewItem(index),
              ),
            ),
          );
        },
      ),
    );
  }

  ///ListView 对应的子条目
  Container buildListViewItem(int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 40,
      color: Colors.cyan[100 * (index % 9)],
    );
  }
}
