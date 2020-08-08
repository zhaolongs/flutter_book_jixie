import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/code20/main_data2018.dart';
import 'package:flutterbookcode/demo/ani/demo_flip_page.dart';
import 'package:flutterbookcode/demo/vn3/main_data3d.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2001.dart';
import 'main_data2002.dart';
import 'main_data2003.dart';
import 'main_data2004.dart';
import 'main_data2005.dart';
import 'main_data2006.dart';
import 'main_data2007.dart';
import 'main_data2008.dart';
import 'main_data2009.dart';
import 'main_data2010.dart';
import 'main_data2012.dart';
import 'main_data2013.dart';
import 'main_data2014.dart';
import 'main_data2015.dart';
import 'main_data2016.dart';
import 'main_data2017.dart';
import 'main_data2019.dart';





class OtherTransformWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<OtherTransformWidgetMainPage> {

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
     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
   ],),);
  }

  bluldLeftWidget(BuildContext context){
    return [

      buildContainerAndClick("Transform 旋转",(){NavigatorUtils.pushPage(context, TransformBaseUsePage());}),
      buildContainerAndClick("Transform 缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage());}),
      buildContainerAndClick("Transform 水平或竖直缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage2());}),
      buildContainerAndClick("Transform 函数方式缩放变换",(){NavigatorUtils.pushPage(context, TransformScalePage3());}),
      buildContainerAndClick("Transform 函数平移变换",(){NavigatorUtils.pushPage(context, TransformTranslationPage2());}),
      buildContainerAndClick("Transform 矩阵数组平移变换",(){NavigatorUtils.pushPage(context, TransformTranslationPage1());}),
      buildContainerAndClick("Transform skew x轴方向 倾斜",(){NavigatorUtils.pushPage(context, TransformSkewPage1());}),
      buildContainerAndClick("Transform skew y轴方向倾斜",(){NavigatorUtils.pushPage(context, TransformSkewPage2());}),
      buildContainerAndClick("Transform skew x轴与y轴方向同时配置倾斜",(){NavigatorUtils.pushPage(context, TransformSkewPage3());}),

//      buildContainerAndClick("Transform 视差效果",(){NavigatorUtils.pushPage(context, TransformTranslationPage4());}),

      buildContainerAndClick("Matrix4Transform 旋转1",(){NavigatorUtils.pushPage(context, TransformTranslationPage10());}),
      buildContainerAndClick("Matrix4Transform 旋转2",(){NavigatorUtils.pushPage(context, TransformTranslationPage11());}),

      buildContainerAndClick("compose 复合变换",(){NavigatorUtils.pushPage(context, TransformTranslationPage12());}),





    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


      buildContainerAndClick(" Matrix4 矩阵方法汇总说明",(){NavigatorUtils.pushPage(context, TransformTranslationPage7());}),
      buildContainerAndClick(" Matrix4 矩阵空间旋转示例分析",(){NavigatorUtils.pushPage(context, TransformTranslationPage8());}),
      buildContainerAndClick(" Matrix4 矩阵组合换",(){NavigatorUtils.pushPage(context, TransformTranslationPage9());}),

      buildContainerAndClick(" 视差效果 推理",(){NavigatorUtils.pushPage(context, TransformTranslationPage3());}),
      buildContainerAndClick(" 图片前投影",(){NavigatorUtils.pushPage(context, TransformTranslationPage5());}),
      buildContainerAndClick(" 图片侧位投影",(){NavigatorUtils.pushPage(context, TransformTranslationPage6());}),

      buildContainerAndClick("翻转切换",(){NavigatorUtils.pushPage(context, FlipMainHomePage());}),
      buildContainerAndClick("3D画廊",(){NavigatorUtils.pushPage(context, Main3DUsePage());}),


    ];
  }

}