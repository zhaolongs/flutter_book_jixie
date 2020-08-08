import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data7001.dart';
import 'main_data7002.dart';
import 'main_data7003.dart';
import 'main_data7004.dart';
import 'main_data7005.dart';
import 'main_data7006.dart';
import 'main_data7007.dart';
import 'main_data7008.dart';
import 'main_data7009.dart';
import 'main_data7010.dart';
import 'main_data7011.dart';
import 'main_data7012.dart';
import 'main_data7013.dart';
import 'main_data7014.dart';
import 'main_data7015.dart';
import 'main_data7016.dart';
import 'main_data7017.dart';
import 'main_data7018.dart';
import 'main_data7019.dart';





class ButtonMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<ButtonMainPage> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Button按钮"
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

      buildContainerAndClick("MaterialButton的基本使用",(){NavigatorUtils.pushPage(context, MaterialButtonBaseUse());}),
      buildContainerAndClick("MaterialButton的子组件",(){NavigatorUtils.pushPage(context, MaterialButtonRow());}),

      buildContainerAndClick("FlatButton",(){NavigatorUtils.pushPage(context, FlatButtonPage());}),


      buildContainerAndClick("RaisedButton与FlatButto的.icon",(){NavigatorUtils.pushPage(context, FlatButtonPage2());}),
      buildContainerAndClick("OutlineButton",(){NavigatorUtils.pushPage(context, FlatButtonPage3());}),
      buildContainerAndClick("FloatingActionButton 悬浮按钮",(){NavigatorUtils.pushPage(context, FloatingActionButtonPage());}),

      buildContainerAndClick("FloatingActionButton mini属性分析",(){NavigatorUtils.pushPage(context, FloatingActionButton2Page());}),
      buildContainerAndClick("FloatingActionButton shape属性分析",(){NavigatorUtils.pushPage(context, FloatingActionButton3Page());}),
      buildContainerAndClick("FloatingActionButton heroTag 动画标签",(){NavigatorUtils.pushPage(context, FloatingActionButton4Page());}),
      buildContainerAndClick("FloatingActionButton 标签样式",(){NavigatorUtils.pushPage(context, FloatingActionButton6Page());}),




    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [

      buildContainerAndClick("仿闲鱼的发布按钮",(){NavigatorUtils.pushPage(context, FloatingActionButton7Page());}),
      buildContainerAndClick("悬浮按钮的旋转",(){NavigatorUtils.pushPage(context, FloatingActionButton8Page());}),
      buildContainerAndClick("底部弹出的按钮效果",(){NavigatorUtils.pushPage(context, FloatingActionButton9Page());}),
      buildContainerAndClick("ProgressButton",(){NavigatorUtils.pushPage(context, ProgressButtonPage());}),
      buildContainerAndClick("IconButton系列",(){NavigatorUtils.pushPage(context, BackButtonPage());}),
      buildContainerAndClick("PopupMenuButton",(){NavigatorUtils.pushPage(context, PopupMenuButtonPage());}),
      buildContainerAndClick("实现类似微信首页右上角的小弹框",(){NavigatorUtils.pushPage(context, PopupMenuButton2Page());}),
      buildContainerAndClick("AnimatedButton 动画切换按钮",(){NavigatorUtils.pushPage(context, AnimatedButtonPage());}),
      buildContainerAndClick("AnimatedButton 动画 进度条 切换按钮",(){NavigatorUtils.pushPage(context, AnimatedStutesButtonPage());}),


    ];
  }

}