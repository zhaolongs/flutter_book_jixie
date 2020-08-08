import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data2301.dart';
import 'main_data2302.dart';
import 'main_data2303.dart';
import 'main_data2304.dart';
import 'main_data2305.dart';
import 'main_data2306.dart';
import 'main_data2307.dart';
import 'main_data2308.dart';
import 'main_data2309.dart';
import 'main_data2310.dart';
import 'main_data2311.dart';
import 'main_data2313.dart';
import 'main_data2314.dart';
import 'main_data2315.dart';
import 'main_data2316.dart';
import 'main_data2317.dart';
import 'main_data2318.dart';
import 'main_data2319.dart';
import 'main_data2320.dart';
import 'main_data2321.dart';
import 'main_data2322.dart';
import 'main_data2324.dart';
import 'main_data2325.dart';
import 'main_data2326.dart';
import 'main_data2327.dart';
import 'main_data2328.dart';
import 'main_data2329.dart';
import 'main_data2330.dart';
import 'main_data2331.dart';
import 'main_data2332.dart';
import 'main_data2333.dart';
import 'main_data2334.dart';
import 'main_data2335.dart';
import 'main_data2336.dart';
import 'main_data2337.dart';
import 'main_data2338.dart';






class AnimationWidgetMainPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<AnimationWidgetMainPage> {

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
      buildContainerAndClick("透明度动画  AnimatedOpacity",(){NavigatorUtils.pushPage(context, AnimatedOpacityPage());}),

      buildContainerAndClick("透明度动画 FadeTransition",(){NavigatorUtils.pushPage(context, FadeTransitionPage());}),
      buildContainerAndClick("透明度动画 Opacity 与 Slider ",(){NavigatorUtils.pushPage(context, AnimatedOpacityPage2());}),
      buildContainerAndClick("透明度动画 Color ARGB ",(){NavigatorUtils.pushPage(context, AnimatedOpacityFromARGBPage());}),


      buildContainerAndClick("缩放动画 动态修改容器的 内边距 Padding ",(){NavigatorUtils.pushPage(context, AnimatedPaddingPage());}),
      buildContainerAndClick("缩放动画 AnimatedPadding ",(){NavigatorUtils.pushPage(context, AnimatedAnimatedPaddingPage());}),
      buildContainerAndClick("缩放动画 Stack 层叠布局中 AnimatedPositioned 实现的动画效果",(){NavigatorUtils.pushPage(context, AnimatedPositionedPage());}),
      buildContainerAndClick("缩放动画 AnimatedSize 实现的动画效果",(){NavigatorUtils.pushPage(context, AnimatedSizePage());}),
      buildContainerAndClick("缩放动画 ScaleTransition 实现的动画效果",(){NavigatorUtils.pushPage(context, ScaleTransitionPage());}),
      buildContainerAndClick("缩放动画 Transform Scale 实现的动画效果",(){NavigatorUtils.pushPage(context, TransformScalePage());}),
      buildContainerAndClick("缩放动画 AnimatedContainer  实现的动画效果",(){NavigatorUtils.pushPage(context, AnimatedContainerPage());}),


      buildContainerAndClick("旋转动画 Transform Roate  实现的动画效果",(){NavigatorUtils.pushPage(context, TransformRotatePage());}),
      buildContainerAndClick("旋转动画 RotationTransition  实现的动画效果",(){NavigatorUtils.pushPage(context, RotationTransitionPage());}),

      buildContainerAndClick("平移动画 SlideTransition  实现的动画效果",(){NavigatorUtils.pushPage(context, SlideTransitionPage());}),
      buildContainerAndClick("平移动画 Transform Translate  实现的动画效果",(){NavigatorUtils.pushPage(context, TransformTranslatePage());}),

      buildContainerAndClick("Tween 基本使用  double 实现的动画效果",(){NavigatorUtils.pushPage(context, TweenPage());}),

      buildContainerAndClick("Tween 基本使用 Color  实现的动画效果",(){NavigatorUtils.pushPage(context, TweenPage2());}),
      buildContainerAndClick("Tween 基本使用 BoxConstraintsTween  实现的动画效果",(){NavigatorUtils.pushPage(context, BoxConstraintsTweenPage());}),
      buildContainerAndClick("Tween 基本使用 DecorationTween  实现的动画效果",(){NavigatorUtils.pushPage(context, DecorationTweenPage());}),

      buildContainerAndClick("Tween 基本使用 BorderRadiusTween  实现的动画效果",(){NavigatorUtils.pushPage(context, BorderRadiusTweenPage());}),
      buildContainerAndClick("Tween 基本使用 BorderTween  实现的动画效果",(){NavigatorUtils.pushPage(context, BorderTweenPage());}),
      buildContainerAndClick("Tween 基本使用 TextStyleTween  实现的动画效果",(){NavigatorUtils.pushPage(context, TextStyleTweenPage());}),
      buildContainerAndClick("Tween 基本使用 TweenSequence 实现的动画效果",(){NavigatorUtils.pushPage(context, TweenSequencePage());}),
      buildContainerAndClick("Tween 基本使用 TweenSequence2  实现的动画效果",(){NavigatorUtils.pushPage(context, TweenSequencePage2());}),
      buildContainerAndClick("Tween 基本使用 TweenSequence3  实现的动画效果",(){NavigatorUtils.pushPage(context, TweenSequencePage3());}),
      buildContainerAndClick("Tween 基本使用 文字抖动  实现的动画效果",(){NavigatorUtils.pushPage(context, TweenSequencePage4());}),


      buildContainerAndClick("CurvedAnimation结合Tween  实现的动画效果",(){NavigatorUtils.pushPage(context, CurvedAnimationAndTween());}),
      buildContainerAndClick("按钮的抖动  实现的动画效果",(){NavigatorUtils.pushPage(context, ButtonShakeAnimationPage());}),




      buildContainerAndClick("CurvedAnimation 基本使用 实现的动画效果",(){NavigatorUtils.pushPage(context, CurvedAnimationPage());}),

      buildContainerAndClick("闪光动画",(){NavigatorUtils.pushPage(context, FlashAnimationPage());}),
      buildContainerAndClick("Hero动画",(){NavigatorUtils.pushPage(context, HeroPage());}),

      buildContainerAndClick("Hero动画 自定义转场动画",(){NavigatorUtils.pushPage(context, HeroPage2());}),
      buildContainerAndClick("Hero动画 实现径向Hero动画",(){NavigatorUtils.pushPage(context, HeroPage3());}),
      buildContainerAndClick("OpenContainer 动画",(){NavigatorUtils.pushPage(context, OpenContainerPage());}),

      buildContainerAndClick("SharedAxisTransition 动画",(){NavigatorUtils.pushPage(context, SharedAxisTransitionPage());}),
      buildContainerAndClick("读书效果",(){NavigatorUtils.pushPage(context, ReadBookPage1());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [


    ];
  }

}