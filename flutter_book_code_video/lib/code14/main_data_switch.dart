import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1401.dart';
import 'main_data1402.dart';
import 'main_data1403.dart';







class SwitchWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<SwitchWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "开关Switch"
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

      buildContainerAndClick("开关Switch的基本使用",(){NavigatorUtils.pushPage(context, SwitchBaseUsePage());}),
      buildContainerAndClick("开关Switch的属性分析",(){NavigatorUtils.pushPage(context, SwitchBaseUsePage2());}),
    buildContainerAndClick("开关Switch ListTitle 的基本使用",(){NavigatorUtils.pushPage(context, SwitchListTitleBaseUsePage());}),




    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}