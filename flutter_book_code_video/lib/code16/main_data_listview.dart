import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1601.dart';
import 'main_data1602.dart';
import 'main_data1603.dart';
import 'main_data1604.dart';
import 'main_data1605.dart';
import 'main_data1606.dart';
import 'main_data1607.dart';
import 'main_data1608.dart';
import 'main_data1609.dart';
import 'main_data1610.dart';
import 'main_data1611.dart';
import 'main_data1612.dart';
import 'main_data1613.dart';







class ListViewMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ListViewMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "列表ListView"
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

      buildContainerAndClick("ListView 的基本使用",(){NavigatorUtils.pushPage(context, ListViewBaseUsePage());}),

      buildContainerAndClick("ListView 的Item状态保持方案一",(){NavigatorUtils.pushPage(context, ListViewUsePage2());}),

      buildContainerAndClick("ListView 的Item状态保持方案二",(){NavigatorUtils.pushPage(context, ListViewUsePage3());}),



      buildContainerAndClick("ListView 的builder方法构建使用",(){NavigatorUtils.pushPage(context, ListViewUsePage4());}),
      buildContainerAndClick("ListView 的separated方法构建使用",(){NavigatorUtils.pushPage(context, ListViewUsePage5());}),
      buildContainerAndClick("ListView 的custom方法构建使用",(){NavigatorUtils.pushPage(context, ListViewUsePage6());}),
      buildContainerAndClick("ListView 添加下拉刷新与上拉加载更多功能",(){NavigatorUtils.pushPage(context, ListViewUsePage7());}),

      buildContainerAndClick("ListView 添加下拉刷新与上拉加载更多功能2",(){NavigatorUtils.pushPage(context, ListViewUsePage8());}),
      buildContainerAndClick("ListView 封装 RefreshListView组件的使用",(){NavigatorUtils.pushPage(context, ListViewUsePage10());}),

      buildContainerAndClick("ListView 侧滑删除",(){NavigatorUtils.pushPage(context, ListViewUsePage9());}),
      buildContainerAndClick("ListView SmartRefresher",(){NavigatorUtils.pushPage(context, ListViewUsePage11());}),

      buildContainerAndClick("ListView 的加载动画",(){NavigatorUtils.pushPage(context, ListViewUsePage12());}),
      buildContainerAndClick("ListView 加载图片性能优化",(){NavigatorUtils.pushPage(context, ListViewUsePage13());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}