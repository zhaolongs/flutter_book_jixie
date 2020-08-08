import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1001.dart
///   流式布局
class WarpMain1Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return buildBody2();
  }
  //lib/code10/main_data1001.dart
  /// Wrap 流式布局 构建模拟数据
  List<Widget>  buildTestData(){
    List<Widget> childWidthList = [];
    ///构建不同宽度的测试数据
    for (int i = 0; i < 20; i++) {
      Container itemContainer = new Container(
        ///圆形背景
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        alignment: Alignment.center,
        height: 30,
        width: (74+i%5*15).toDouble(),
        child: Text("测试数据$i"),
      );
      childWidthList.add(itemContainer);
    }
    
    return childWidthList;
  }

  //lib/code10/main_data1001.dart
  ///页面的主体
  buildBody2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Padding(
        child: Wrap(
          ///包裹的子view
          children: buildTestData(),
          textDirection: TextDirection.ltr,
          //水平排列 默此方式
          direction: Axis.horizontal,
          ///主轴方向上的两个widget之间的间距
          spacing: 12,
          /// 行与行之前的间隔
          runSpacing: 10,
          ///主轴方向的Widget的对齐方式
          alignment: WrapAlignment.spaceEvenly,
          ///次轴方向上的对齐方向
          runAlignment: WrapAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

          ],
        ),
      ),
    );
  }
}
