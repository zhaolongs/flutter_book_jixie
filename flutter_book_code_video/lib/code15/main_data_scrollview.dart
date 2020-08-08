import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code15/main_data1520.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1501.dart';
import 'main_data1502.dart';
import 'main_data1503.dart';
import 'main_data1504.dart';
import 'main_data1505.dart';
import 'main_data1506.dart';
import 'main_data1507.dart';
import 'main_data1508.dart';
import 'main_data1509.dart';
import 'main_data1510.dart';
import 'main_data1512.dart';
import 'main_data1513.dart';
import 'main_data1515.dart';
import 'main_data1516.dart';
import 'main_data1518.dart';
import 'main_data1519.dart';
import 'main_data1521.dart';
import 'main_data1522.dart';
import 'main_data1523.dart';
import 'main_data1524.dart';
import 'main_data1525.dart';
import 'main_data1526.dart';
import 'main_data1527.dart';
import 'main_data1528.dart';
import 'main_data1529.dart';
import 'main_data1530.dart';
import 'main_data1531.dart';
import 'main_data1532.dart';







class ScrollViewMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ScrollViewMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "ScrollView滑动视图"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
   return SingleChildScrollView(child: Row(children: [
     Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
//     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("SingleChildScrollView 的基本使用",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage());}),
      buildContainerAndClick("SingleChildScrollView 的属性分析",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage2());}),
      buildContainerAndClick("SingleChildScrollView 的属性 floationg 分析",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage4());}),
      buildContainerAndClick("滑动控制器",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage5());}),



      buildContainerAndClick("SingleChildScrollView 的controller",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage3());}),

      buildContainerAndClick("SingleChildScrollView 结合Column使用",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage4());}),
      buildContainerAndClick("SingleChildScrollView 下拉刷新",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage5());}),


      buildContainerAndClick("NestedScrollView 的基本使用",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage());}),

      buildContainerAndClick("NestedScrollView 中searchBar的大小变动",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage2());}),

      buildContainerAndClick("NestedScrollView 商品详情页面",(){NavigatorUtils.pushPage(context, NestScrollBaseUsePage3());}),

      buildContainerAndClick("CustomScrollView 的基本使用 SliverGrid",(){NavigatorUtils.pushPage(context, CustomScrollBaseUsePage());}),
      buildContainerAndClick("CustomScrollView 的基本使用 SliverList",(){NavigatorUtils.pushPage(context, CustomScrollBaseUsePage2());}),

      buildContainerAndClick("常见滑动布局的实现 SingleScrollView + GridView + ListView",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage6());}),
      buildContainerAndClick("Sliver适配器SliverToBoxAdapter",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage8());}),
      buildContainerAndClick("Sliver内边距SliverPadding",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage9());}),
      buildContainerAndClick(" Sliver头布局SliverPersistentHeader",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage10());}),

      buildContainerAndClick(" SliverOverlapAbsorber",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage11());}),
      buildContainerAndClick(" Sliver填充组件SliverFillRemaining",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage12());}),
      buildContainerAndClick(" Sliver填充组件SliverFillViewport",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage13());}),

      buildContainerAndClick("常见滑动布局的实现 CustomScrollView + SliverGrid + SliverList",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage14());}),
      buildContainerAndClick("常见滑动布局的实现 CustomScrollView + SliverGrid + SliverList 2",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage15());}),
      buildContainerAndClick("滑动监听 NotificationListener ",(){NavigatorUtils.pushPage(context, NotificationListenerUsePage());}),
      buildContainerAndClick(" CupertinoScrollbar 基本使用 ",(){NavigatorUtils.pushPage(context, ScrollableUsePage());}),
      buildContainerAndClick(" Scrollable 基本使用 ",(){NavigatorUtils.pushPage(context, ScrollableUsePage2());}),

//      buildContainerAndClick("常见滑动布局的实现 SingleScrollView + GridView + ListView 滑动冲突解决",(){NavigatorUtils.pushPage(context, ScrollBaseUsePage7());}),
      buildContainerAndClick(" ListWheelScrollView 轮子滚动效果 ",(){NavigatorUtils.pushPage(context, ListWheelScrollViewPage());}),
      buildContainerAndClick(" ListWheelScrollView 轮子滚动效果 属性分析使用",(){NavigatorUtils.pushPage(context, ListWheelScrollViewPage2());}),
      buildContainerAndClick(" DraggableScrollableSheet分析使用",(){NavigatorUtils.pushPage(context, DraggableScrollableSheetPage());}),

      buildContainerAndClick(" 上拉抽屉实现",(){NavigatorUtils.pushPage(context, BottomDragWidget());}),
      buildContainerAndClick(" 上拉抽屉实现 2",(){NavigatorUtils.pushPage(context, BottomDragWidget2());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}