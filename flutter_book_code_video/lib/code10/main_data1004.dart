import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1004.dart
///   流式布局 Flow 初探
class FlowMain1Page1 extends StatefulWidget {
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
  //lib/code10/main_data1004.dart
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
        child: Text("测试数据$i"),
      );
      childWidthList.add(itemContainer);
    }
    
    return childWidthList;
  }

  //lib/code10/main_data1004.dart
  ///页面的主体
  buildBody2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局 初探"),
      ),
      body: Container(width: 400,height:400,child: Flow(
        ///代理
        delegate: TestFlowDelegate(),
        ///使用到的子Widget
        children: buildTestData(),
      ),),
    );
  }
}

//lib/code10/main_data1004.dart
///   流式布局 Flow
class TestFlowDelegate extends FlowDelegate {
  ///用来配置每个子Widget的外边距
  EdgeInsets margin ;
  double spaceing;
  int rowNumber ;
  TestFlowDelegate({this.margin=EdgeInsets.zero,this.spaceing=1.0,this.rowNumber= 2});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    ///获取Flow的大小
    Size preSize = context.size;
    //
    double prentWidget = preSize.width;
    ///计算每个子Widget的宽度
    double itemWidth = (prentWidget - margin.left-margin.right-(rowNumber-1)*spaceing)/rowNumber;
    ///计算每个子Widget的高度
    double itemHeight = itemWidth/10*8;
    //计算每一个子widget的位置
    for (var i = 0; i < context.childCount; i++) {

      ///获取第i个子Widget的大小
      Size itemChildSize =  context.getChildSize(i);
      ///计算每一个子Widget的宽度  原有的宽度+左右外边距
      var w = x + itemWidth;
      ///获取childWidget可以绘制的最大的范围
      if (w < context.size.width) {
        ///在Flow中进行绘制
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        //换行
        x = margin.left;
        y = y + itemHeight + margin.bottom;
        ///绘制
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = x + itemChildSize.width + margin.right + margin.left;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  //  是否需要重新布局。
  @override
  bool shouldRelayout(FlowDelegate oldDelegate) {
    return super.shouldRelayout(oldDelegate);
  }
  //设置Flow的尺寸
  @override
  Size getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return super.getSize(constraints);
  }

  //  设置每个child的布局约束条件
  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return super.getConstraintsForChild(i, constraints);
  }


}