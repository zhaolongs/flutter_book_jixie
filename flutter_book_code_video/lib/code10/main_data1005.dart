import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//lib/code10/main_data1005.dart
///   流式布局 Flow 圆形菜单
class FlowMain1Page2 extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}
//lib/code10/main_data1005.dart
///   流式布局 Flow 圆形菜单
class _PageState extends State     with SingleTickerProviderStateMixin {

  ///动画控制器
  AnimationController _controller;
  ///变化比率
  double _rad = 0.0;
  ///是否执行完动画，或者说是动画停止
  bool _closed = true;

  @override
  void initState() {
    super.initState();
    ///创建动画控制器
    ///执行时间为200毫秒
    _controller =
    AnimationController(duration: Duration(milliseconds: 200), vsync: this)
    ///设置监听，每当动画执行时就会实时回调此方法
      ..addListener((){
        setState(() {
          ///从0到1
          _rad =_controller.value;
          print("$_rad ");
        });

      })
      ///设置状态监听
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("正向执行完毕 ");
          _closed = !_closed;
        }else if(status == AnimationStatus.dismissed){
          print("反向执行完毕 ");
          _closed = !_closed;
        }

      });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody2();
  }

  //lib/code10/main_data1005.dart
  ///   流式布局 Flow 圆形菜单
  ///构建菜单所使用到的图标
  List<Icon> iconList =[
    Icon(Icons.add,color: Colors.white,),
    Icon(Icons.wallpaper,color: Colors.white,),
    Icon(Icons.message,color: Colors.white,),
    Icon(Icons.share,color: Colors.white,),
    Icon(Icons.home,color: Colors.white,),
  ];

  //lib/code10/main_data1005.dart
  /// Flow 流式布局 构建菜单数据Widget
  List<Widget>  buildTestData(){
    List<Widget> childWidthList = [];
    for (int i = 0; i < iconList.length; i++) {
      ///每个菜单添加InkWell点击事件
      Widget itemContainer = InkWell(onTap: (){
        ///打开或者关闭菜单
        colseOrOpen();
        ///点击菜单其他的操作
      },child:new Container(
        ///圆形背景
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.all(Radius.circular(23))
        ),
        alignment: Alignment.center, height: 44, width: 44,
        child: iconList[i],
      ),);
      childWidthList.add(itemContainer,);
    }
    return childWidthList;
  }

  //lib/code10/main_data1005.dart
  ///页面的主体
  buildBody2() {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Stack(children: [
        Flow(
          ///代理
          delegate: TestFlowDelegate(radiusRate: _rad),
          ///使用到的子Widget
          children: buildTestData(),
        )
        ],),
    );
  }

  ///控制菜单的打开或者关闭
  void colseOrOpen() {
    if (_closed) {
      _controller.reset();
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}

//lib/code10/main_data1005.dart
///  流式布局 Flow 计算
class TestFlowDelegate extends FlowDelegate {

  ///菜单的内边距
  EdgeInsets padding;
  ///菜单展开的初始角度 （弧度）
  double initAngle;
  ///半径变化的比率
  ///一般从0到1 菜单展开
  ///从1-0菜单关闭
  double radiusRate;

  TestFlowDelegate({this.radiusRate=0, this.padding=EdgeInsets.zero, this.initAngle=0});

  @override
  void paintChildren(FlowPaintingContext context) {
    calculWrapSpacingChild2(context);
  }

  //lib/code10/main_data1005.dart
  ///  流式布局 Flow 计算
  void calculWrapSpacingChild2(FlowPaintingContext context) {
    ///初始绘制位置为Flow布局的左上角
    double x = 0.0;
    double y = 0.0;

    //获取当前画布的最小边长，width与height谁小取谁
    double radius = context.size.shortestSide;

    ///默认将所有的子Widget绘制到左下角
    x = radius;
    y= radius;

    ///角度
    double a = 0.5/(context.childCount-1)*4;

    //计算每一个子widget的位置
    for (var i = 0; i < context.childCount-1; i++) {
      ///获取第i个子Widget的大小
      Size itemChildSize =  context.getChildSize(i);
      ///计算每个子Widget 的坐标
      x= context.size.width -itemChildSize.width*1.4- cos(a*i+initAngle)*radius/3*radiusRate;
      y= context.size.height - itemChildSize.height*2 - sin(a*i+initAngle)*radius/3*radiusRate;
      ///在Flow中进行绘制
      context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
    }

    ///最后一个做为菜单选项
    int lastIndex = context.childCount-1;
    Size lastChildSize= context.getChildSize(lastIndex);
    double lastx= context.size.width -lastChildSize.width*1.4;
    double lasty= context.size.height - lastChildSize.height*2;
    ///绘制这个菜单在左下角
    context.paintChild(lastIndex, transform: new Matrix4.translationValues(lastx, lasty, 0.0));

  }


  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  //  是否需要重新布局。
  @override
  bool shouldRelayout(FlowDelegate oldDelegate) {
    return true;
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