import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code2/main_data38.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data301.dart';
import 'main_data43-1.dart';
import 'main_data43-2.dart';
import 'main_data43-3.dart';







class ScaffoldWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ScaffoldWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "container"
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




      buildContainerAndClick("BottomAppBar与悬浮按钮结合使用",(){NavigatorUtils.pushPage(context, BottomAppBarAndFloatButtonPage());}),


      buildContainerAndClick("3D底部菜单",(){NavigatorUtils.pushPage(context, Bottom3DBarPage());}),
      buildContainerAndClick("PageView实现滑动标签页面切换",(){NavigatorUtils.pushPage(context, TabFromRowPage2());}),
      buildContainerAndClick("TabBarView实现滑动标签页面切换",(){NavigatorUtils.pushPage(context, TabFromRowPage3());}),



    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}