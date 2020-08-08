import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2201.dart';
import 'main_data2202.dart';
import 'main_data2203.dart';
import 'main_data2204.dart';
import 'main_data2205.dart';
import 'main_data2206.dart';
import 'main_data2207.dart';
import 'main_data2208.dart';
import 'main_data2209.dart';





class OtherWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<OtherWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "其他组件"
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

      buildContainerAndClick("WidgetsBindingObserver",(){NavigatorUtils.pushPage(context, WidgetWillAppearPage());}),

      buildContainerAndClick("FittedBox 组件",(){NavigatorUtils.pushPage(context, FittedBoxPage());}),

      buildContainerAndClick("BoxConstraints 组件",(){NavigatorUtils.pushPage(context, ConstrainedBoxPage());}),


      buildContainerAndClick("LinearProgressIndicator 组件",(){NavigatorUtils.pushPage(context, LinearProgressIndicatorPage());}),
      buildContainerAndClick("CircularProgressIndicator 组件",(){NavigatorUtils.pushPage(context, CircularProgressIndicatorPage());}),
      buildContainerAndClick("RefreshProgressIndicator 组件",(){NavigatorUtils.pushPage(context, RefreshProgressIndicatorPage());}),

      buildContainerAndClick("Divider 组件",(){NavigatorUtils.pushPage(context, DividerPage());}),
      buildContainerAndClick("FutureBuilder 组件",(){NavigatorUtils.pushPage(context, FutureBuilderPage());}),

      buildContainerAndClick("FutureBuilder 组件",(){NavigatorUtils.pushPage(context, FutureBuilderPage2());}),
    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}