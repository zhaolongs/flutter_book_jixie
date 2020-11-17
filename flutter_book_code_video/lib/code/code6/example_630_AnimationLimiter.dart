import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    home: Example630(),
  ));
}

///代码清单 6-45 ListView的加载动画
///lib/code/code6/example_630_AnimationLimiter.dart
class Example630 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("ListView加载动画"),
      ),
      //动画监听
      body: AnimationLimiter(
        //列表组件
        child: buildListView(),
      ),
    );
  }

  //ListView的实现
  ListView buildListView() {
    //懒加载的方式
    return ListView.builder(
      itemCount: 100,
      //ListView子Item构建
      itemBuilder: (context, index) {
        return buildListItemWidget(index);
      },
    );
  }

  //ListView中每个子Item中的UI构建
  AnimationConfiguration buildListItemWidget(int index) {
    //动画构建器
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        //滑动动画
        verticalOffset: 50.0,
        child: FadeInAnimation(
          //渐隐渐现动画 child 为ListView 子Item的具体实现
          child: Container(
            margin: EdgeInsets.all(5),
            color: Colors.orange,
            height: 60,
          ),
        ),
      ),
    );
  }

}
