import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example307(),
  ));
}



class Example307 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example307> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow"),
      ),
      //填充屏幕空间
      body: buildFlow(),
    );
  }

  ///代码清单 3-15 Flow 的基本使用
  ///lib/code/code3/example_307_flow_page.dart
  Widget buildFlow(){
    return Flow(
      //包裹的子view
      children: buildTestChildWidget(),
      //代理
      delegate: TestFlowDelegate(),
    );
  }
  ///代码清单 3-16 Flow 中使用的子Widget构建
  ///lib/code/code3/example_307_flow_page.dart
  List<Widget>  buildTestChildWidget(){
    List<Widget> childWidthList = [];
    ///构建不同宽度的测试数据
    for (int i = 0; i < 20; i++) {
      Container itemContainer = new Container(
        //圆角矩形背景
        decoration: BoxDecoration(
          //灰色
            color: Colors.grey[300],
            //四个圆角
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        //子Widget居中对齐
        alignment: Alignment.center,
        height: 30,
        //计算不同的宽度
        width: (74+i%5*15).toDouble(),
        child: Text("测试数据$i"),
      );
      //List中添加子Widget
      childWidthList.add(itemContainer);
    }

    return childWidthList;
  }

 
}
///代码清单 3-17 FlowDelegate 的基本使用
///计算自适应换行功能
///lib/code/code3/example_307_flow_page.dart
class TestFlowDelegate extends FlowDelegate {

  //每两个Widget之前的间隔
  double spacing=12.0;
  //每两行之间的间隔
  double runSpacint =12.0;

  @override
  void paintChildren(FlowPaintingContext context) {

    calculWrapSpacingChild(context);
  }
  void calculWrapSpacingChild(FlowPaintingContext context) {
    //初始绘制位置为Flow布局的左上角
    double x = spacing;
    double y = 0.0;

    List<int> indexLsit =[];

    //计算每一个子widget的位置
    for (var i = 0; i < context.childCount; i++) {
      //获取第i个子Widget的大小
      Size itemChildSize =  context.getChildSize(i);
      //计算每一个子Widget的宽度  原有的宽度
      var w = x + itemChildSize.width ;
      //获取childWidget可以绘制的最大的范围
      if (w >context.size.width) {
        indexLsit.add(i);
        x = spacing + itemChildSize.width +spacing;
      } else {
        x = w+spacing ;
      }
    }
    print("获取到的换行角标是"+indexLsit.toString());

    for (var i = 0; i < indexLsit.length; i++) {

      int preIndex =0;
      if(i!=0){
        preIndex = indexLsit[i-1];
      }
      int index = indexLsit[i];
      print("开始计算角标wufl preIndex=$preIndex index=$index");

      double totalChildWidth = 0.0;
      for (var j = preIndex; j < index; j++) {
        //获取第i个子Widget的大小
        Size itemChildSize =  context.getChildSize(i);
        totalChildWidth+=itemChildSize.width;
      }
      //计算剩余空白的宽度
      double itemSpace =context.size.width - totalChildWidth;
      print("剩余空白的宽度 $itemSpace");
      //计算间隔的个数
      int spaceNumber =index-preIndex+1;
      print("计算间隔的个数 $spaceNumber");
      //计算配置的spaceing占用的空白大小
      double totalSpace = spaceNumber*spacing;
      print("原spacing $spacing");

      double columnSpacing =0;
      //将剩余的空白平均分配给每一个spacing
      if(totalSpace<itemSpace){
        double unitSpace = (itemSpace-totalSpace)/spaceNumber;
        print("unitSpace $unitSpace");
        columnSpacing=unitSpace+spacing;
      }

      x = columnSpacing;
      print("现spacing $columnSpacing");
      for (var j = preIndex; j <index; j++) {
        //获取第i个子Widget的大小
        Size itemChildSize =  context.getChildSize(j);
        //计算每一个子Widget的宽度  原有的宽度
        var w = x + itemChildSize.width ;
        print("绘制1 $x  $y");
        context.paintChild(j, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w +columnSpacing;
      }
      Size itemChildSize =  context.getChildSize(preIndex);
      y = y + itemChildSize.height + runSpacint;

    }
  }
  void calculWrapChild(FlowPaintingContext context) {
    //初始绘制位置为Flow布局的左上角
    double x = spacing;
    double y = 0.0;

    //计算每一个子widget的位置
    for (var i = 0; i < context.childCount; i++) {
      //获取第i个子Widget的大小
      Size itemChildSize =  context.getChildSize(i);
      //计算每一个子Widget的宽度  原有的宽度
      var w = x + itemChildSize.width ;
      //获取childWidget可以绘制的最大的范围
      if (w < context.size.width) {
        //在Flow中进行绘制
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = w+spacing ;
      } else {
        //换行
        x = spacing;
        y = y + itemChildSize.height + runSpacint;
        //绘制
        context.paintChild(i, transform: new Matrix4.translationValues(x, y, 0.0));
        x = x + itemChildSize.width +spacing;
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
