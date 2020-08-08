import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data1301.dart';
import 'main_data1302.dart';
import 'main_data1303.dart';
import 'main_data1304.dart';
import 'main_data1305.dart';
import 'main_data1306.dart';
import 'main_data1308.dart';
import 'main_data1309.dart';
import 'main_data1310.dart';
import 'main_data1311.dart';
import 'main_data1312.dart';
import 'main_data1313.dart';
import 'main_data1314.dart';
import 'main_data1315.dart';
import 'main_data1316.dart';
import 'main_data1317.dart';
import 'main_data1318.dart';
import 'main_data1319.dart';
import 'main_data1320.dart';
import 'main_data1321.dart';
import 'main_data1322.dart';
import 'main_data1323.dart';

class GestureDetectorMainPage extends StatefulWidget {
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetectorMainPage> {
  @override
  Widget build(BuildContext context) {
    return buildMainBody(context);
  }

  Widget buildMainBody(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Radio单行框组件"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(context),
        ));
  }

  buildBodyFunction(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bluldLeftWidget(context),
              ),
              margin: EdgeInsets.only(right: 20),
            ),
          ),
     Expanded(child: Container(child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: bluldLeftWidget2(context),),),)
        ],
      ),
    );
  }

  bluldLeftWidget(BuildContext context) {
    return [
      buildContainerAndClick("GestureDetector与InkWell的基本使用", () {
        NavigatorUtils.pushPage(context, GestureDetectorUsePage());
      }),
      buildContainerAndClick("GestureDetector与使用", () {
        NavigatorUtils.pushPage(context, GesturTapPage());
      }),
      buildContainerAndClick("拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnPanPage());
      }),
      buildContainerAndClick("竖直方向的拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnVerticalPanPage());
      }),
      buildContainerAndClick("水平方向的拖动与滑动", () {
        NavigatorUtils.pushPage(context, GesturOnVerticalPanPage());
      }),
      buildContainerAndClick("双指缩放", () {
        NavigatorUtils.pushPage(context, DoubleOnScaleImagePage());
      }),
    buildContainerAndClick("双指旋转图片", () {
    NavigatorUtils.pushPage(context, RoteImagePage());
    }),
      buildContainerAndClick("双指旋转、缩放、拖动图片", () {
        NavigatorUtils.pushPage(context, RoteAndScaleImagePage());
      }),
      buildContainerAndClick("双指旋转、缩放、拖动图片2", () {
        NavigatorUtils.pushPage(context, RoteAndScaleImagePage2());
      }),
    buildContainerAndClick("双指旋转、缩放、拖动图片 依赖库使用", () {
    NavigatorUtils.pushPage(context, RoteAndScaleImagePage3());
    }),
      buildContainerAndClick("PageView 浏览多个图片", () {
        NavigatorUtils.pushPage(context, PageViewAndScaleImagePage());
      }),





      buildContainerAndClick("Flutter获取点击元素的位置与大小", () {
        NavigatorUtils.pushPage(context, BindingObservePage());
      }),


      buildContainerAndClick("缩放与拖动结合", () {
        NavigatorUtils.pushPage(context, GesturScaleAndSpanPage());
      }),
      buildContainerAndClick("双击放大图片", () {
        NavigatorUtils.pushPage(context, DoubleTapScaleImagePage());
      }),

      buildContainerAndClick("图像的移动", () {
        NavigatorUtils.pushPage(context, GesturTapMoveImagePage());
      }),

      buildContainerAndClick("图片的缩放", () {
        NavigatorUtils.pushPage(context, ImageScalePage());
      }),
    ];
  }

  bluldLeftWidget2(BuildContext context) {
    return [
      buildContainerAndClick("InkWell点击事件的基本使用", () {
        NavigatorUtils.pushPage(context, InkWellUsePage());
      }),
      buildContainerAndClick("InkWell 通过Ink来配置装饰样式", () {
        NavigatorUtils.pushPage(context, InkWellUsePage2());
      }),
      buildContainerAndClick("InkWell 属性分析", () {
        NavigatorUtils.pushPage(context, InkWellUsePage3());
      }),
      buildContainerAndClick("InkWell 属性分析2", () {
        NavigatorUtils.pushPage(context, InkWellUsePage4());
      }),

      buildContainerAndClick("InkResponse ", () {
        NavigatorUtils.pushPage(context, InkWellUsePage5());
      }),

      buildContainerAndClick("为图片添加点击事件 ", () {
        NavigatorUtils.pushPage(context, InkWellUsePage6());
      }),
      buildContainerAndClick("为局部文本添加点击事件 ", () {
        NavigatorUtils.pushPage(context, InkWellUsePage7());
      }),

    ];
  }
}
