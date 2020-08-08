import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1801.dart';
import 'main_data1802.dart';
import 'main_data1803.dart';
import 'main_data1804.dart';
import 'main_data1805.dart';
import 'main_data1806.dart';
import 'main_data1807.dart';
import 'main_data1808.dart';
import 'main_data1809.dart';
import 'main_data1810.dart';
import 'main_data1811.dart';
import 'main_data1812.dart';







class ClipViewMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ClipViewMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Clip裁剪组件系列"
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

      buildContainerAndClick("ClipRect 的基本使用 ",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage());}),
      buildContainerAndClick("ClipRRect 的基本使用2 ",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage2());}),
      buildContainerAndClick("ClipOval 的基本使用 ",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage3());}),
      buildContainerAndClick("CircleAvatar 的基本使用 ",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage4());}),
      buildContainerAndClick("ClipPath.shape的基本使用 ",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage5());}),
      buildContainerAndClick("ClipPath的基本使用 下拉视差效果",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage6());}),
      buildContainerAndClick("ClipPath的基本使用 上推的视差效果",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage7());}),
      buildContainerAndClick("ClipPath的基本使用 波浪式的效果",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage8());}),
      buildContainerAndClick("ClipPath的基本使用 三角形边缘",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage9());}),
      buildContainerAndClick("ClipPath的基本使用 小半圆边缘",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage10());}),
      buildContainerAndClick("ClipPath的基本使用 四个角圆弧内切效果",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage11());}),
      buildContainerAndClick("ClipPath的基本使用 上内切效果",(){NavigatorUtils.pushPage(context, ClipRectBaseUsePage12());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}