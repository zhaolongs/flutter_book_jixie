import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1101.dart';
import 'main_data1102.dart';
import 'main_data1103.dart';
import 'main_data1104.dart';
import 'main_data1105.dart';
import 'main_data1106.dart';







class  CheckBoxMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<CheckBoxMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "CheckBox复选框"
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

      buildContainerAndClick("复选框的基本使用",(){NavigatorUtils.pushPage(context, CheckBoxBaseUsePage());}),
      buildContainerAndClick("CheckboxListTile 的基本使用",(){NavigatorUtils.pushPage(context, CheckboxListTilePage());}),

      buildContainerAndClick("圆形复选框",(){NavigatorUtils.pushPage(context, RotundityCheckBoxPage());}),
      buildContainerAndClick("圆形图片复选框",(){NavigatorUtils.pushPage(context, RotundityImageCheckBoxPage());}),
      buildContainerAndClick("仿开源中国注册页面",(){NavigatorUtils.pushPage(context, OsChinaLoginPage());}),
      buildContainerAndClick("WidgetsBindingObserver",(){NavigatorUtils.pushPage(context, WidgetsBindingObserverPage());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}