import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1001.dart';
import 'main_data1002.dart';
import 'main_data1003.dart';
import 'main_data1004.dart';
import 'main_data1005.dart';
import 'main_data1007.dart';
import 'main_data1008.dart';
import 'main_data1009.dart';
import 'main_data1010.dart';
import 'main_data1011.dart';
import 'main_data1012.dart';
import 'main_data1013.dart';
import 'main_data1014.dart';
import 'main_data1015.dart';
import 'main_data1016.dart';
import 'main_data1017.dart';
import 'main_data1018.dart';
import 'main_data1019.dart';
import 'main_data1020.dart';
import 'main_data1021.dart';
import 'main_data1022.dart';
import 'main_data1023.dart';






class  UilayoutWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<UilayoutWidgetMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "UI布局"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),));
  }

  buildBodyFunction(BuildContext context){
   return SingleChildScrollView(child: Row(children: [
     Expanded(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget(context),),margin: EdgeInsets.only(right: 20),),),
     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("Warp流式布局",(){NavigatorUtils.pushPage(context, WarpMain1Page());}),
      buildContainerAndClick("文字TAG标签",(){NavigatorUtils.pushPage(context, TextWarpMain1Page());}),
      buildContainerAndClick("流式布局Flow",(){NavigatorUtils.pushPage(context, FlowMain1Page());}),
      buildContainerAndClick("流式布局Flow初探",(){NavigatorUtils.pushPage(context, FlowMain1Page1());}),
      buildContainerAndClick("圆形动态弹出菜单",(){NavigatorUtils.pushPage(context, FlowMain1Page2());}),

      buildContainerAndClick("向上动态弹出菜单",(){NavigatorUtils.pushPage(context, FlowMain1Page5());}),
      buildContainerAndClick("中间圆形动态弹出菜单",(){NavigatorUtils.pushPage(context, FlowMain1Page4());}),

      buildContainerAndClick("Flex布局",(){NavigatorUtils.pushPage(context, FlexMain1Page());}),
      buildContainerAndClick("Flexible和 Expanded的区别",(){NavigatorUtils.pushPage(context, FlexMain2Page());}),


    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [
      buildContainerAndClick("Column基本使用",(){NavigatorUtils.pushPage(context, ColumnMain1Page());}),
      buildContainerAndClick("Column 的对齐方式",(){NavigatorUtils.pushPage(context, ColumnMain2Page());}),
      buildContainerAndClick("Column verticalDirection",(){NavigatorUtils.pushPage(context, ColumnMain3Page());}),
      buildContainerAndClick("Column 权重适配",(){NavigatorUtils.pushPage(context, ColumnMain4Page());}),
      buildContainerAndClick("Column 等比适配",(){NavigatorUtils.pushPage(context, ColumnMain5Page());}),
      buildContainerAndClick("Column 填充与包裹",(){NavigatorUtils.pushPage(context, ColumnMain6Page());}),

      buildContainerAndClick("Row的基本使用",(){NavigatorUtils.pushPage(context, RowMainPage());}),
      buildContainerAndClick("Row的对齐方式",(){NavigatorUtils.pushPage(context, RowMain1Page());}),
      buildContainerAndClick("Row的权重适配",(){NavigatorUtils.pushPage(context, RowMain2Page());}),

      buildContainerAndClick("Stack的基本使用",(){NavigatorUtils.pushPage(context, StackMain1Page());}),
      buildContainerAndClick("Stack的基本使用2",(){NavigatorUtils.pushPage(context, StackMain2Page());}),
      buildContainerAndClick("Stack left、top 、right、 bottom",(){NavigatorUtils.pushPage(context, StackMain3Page());}),
      buildContainerAndClick("Positioned的width和height",(){NavigatorUtils.pushPage(context, StackMain4Page());}),

    ];
  }

}