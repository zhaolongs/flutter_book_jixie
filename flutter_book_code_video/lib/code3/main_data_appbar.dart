//4.1 /lib/code3/main_data41.dart
//bottomNavigationBar配制底部导航栏菜单
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data43-1.dart';
import 'main_data43-2.dart';
import 'main_data43-3.dart';
import 'main_data43.dart';
import 'main_data65-1.dart';


class MainAppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}
class FirstPagetate extends State<MainAppBarPage> {
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
    return Row(children: [
      Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),
      Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),
    ],);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick(" Row 在 AppBar中实现的标签栏切换效果",(){NavigatorUtils.pushPage(context, TabFromRowTestPage());}),
      buildContainerAndClick(" Row 在 AppBar中实现的标签栏切换效果",(){NavigatorUtils.pushPage(context, TabFromRowPage());}),
      buildContainerAndClick(" Row标签结合PageView实现滑动切换",(){NavigatorUtils.pushPage(context, TabFromRowPage2());}),
      buildContainerAndClick(" Row标签结合TabBarView实现滑动切换",(){NavigatorUtils.pushPage(context, TabFromRowPage3());}),

      RaisedButton(child: Text("MediaQuery分析"),onPressed: () { NavigatorUtils.pushPage(context, MediaQueryFirstPage()); },),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [

      RaisedButton(child: Text("MediaQuery分析"),onPressed: () { NavigatorUtils.pushPage(context, MediaQueryFirstPage()); },),

    ];
  }
}
