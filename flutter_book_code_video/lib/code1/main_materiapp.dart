
//2.2MaterialApp的基本使用
//lib/code1/main_data1.dart
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data12.dart';
import 'main_data13.dart';
import 'main_data13_1.dart';
import 'main_data17.dart';
import 'main_data18.dart';
import 'main_data19.dart';
import 'main_data20.dart';
import 'main_data9.dart';

class MaterialAppMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<MaterialAppMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "MaterialApp 专题"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
    return SingleChildScrollView(child: Row(children: [
      Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
//      Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
    ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("国际化示例配置日期组件的显示语言1",(){NavigatorUtils.pushPage(context, DateLnaguageSelectPage());}),
      buildContainerAndClick("国际化示例配置日期组件的显示语言2",(){NavigatorUtils.pushPage(context, DateLnaguageSelectPage2());}),

      buildContainerAndClick("国际化示例配置日期组件的显示语言3",(){NavigatorUtils.pushPage(context, DateLnaguageSelectPage3());}),
      buildContainerAndClick("国际化配置文本",(){NavigatorUtils.pushPage(context, LangeageSelectPage());}),

      buildContainerAndClick("圆形效果逐渐打开页面",(){NavigatorUtils.pushPage(context, CustoumRoutesApp());}),

      buildContainerAndClick("多主题配角",(){NavigatorUtils.pushPage(context, CustoumRoutesApp());}),

      buildContainerAndClick("浅谈Provider进行状态管理 引用数据并实现数据的修改",(){NavigatorUtils.pushPage(context, TestProviderPage());}),
      buildContainerAndClick("浅谈Provider进行状态管理 MultiProvider",(){NavigatorUtils.pushPage(context, TestMultiProviderPage());}),

      buildContainerAndClick("浅谈Provider进行状态管理 MultiProvider Consumer",(){NavigatorUtils.pushPage(context, TestMultiProviderConsumerPage());}),


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [



    ];
  }

}