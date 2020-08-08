import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1201.dart';
import 'main_data1202.dart';
import 'main_data1203.dart';
import 'main_data1204.dart';








class  RadioMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<RadioMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Radio单行框组件"
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

      buildContainerAndClick("单选框的基本使用",(){NavigatorUtils.pushPage(context,RadioBaseUsePage());}),

      buildContainerAndClick("VisualDensity 视觉密度配制",(){NavigatorUtils.pushPage(context,RadioVisualDensityPage());}),
      buildContainerAndClick("RadioListTitle 的基本使用",(){NavigatorUtils.pushPage(context,RadioListTitlePage());}),
      buildContainerAndClick("底部弹框优惠券选项 ",(){NavigatorUtils.pushPage(context,ModalBottomSheetPage());}),


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}