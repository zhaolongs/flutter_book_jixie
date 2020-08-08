
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code/common_founction.dart';
import 'package:flutterbookcode/utils/code1/navigator_utils.dart';

import 'main_data9001.dart';
import 'main_data9002.dart';
import 'main_data9003.dart';
import 'main_data9004.dart';
import 'main_data9005.dart';
import 'main_data9006.dart';
import 'main_data9007.dart';
import 'main_data9008.dart';
import 'main_data9009.dart';
import 'main_data9010.dart';
import 'main_data9011.dart';
import 'main_data9012.dart';
import 'main_data9013.dart';
import 'main_data9015.dart';
import 'main_data9016.dart';
import 'main_data9017.dart';

/*
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class ImageMainPage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

//lib/code9/image_main_data.dart
class _ImagePageState extends State<ImageMainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
              "Image组件"
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



      buildContainerAndClick("Image.asset的基本使用",(){NavigatorUtils.pushPage(context, ImageAssetsBaseUsePage());}),
      buildContainerAndClick("Image.network的基本使用",(){NavigatorUtils.pushPage(context, ImageNetBaseUsePage());}),
      buildContainerAndClick("Image 构造函数加载图片",(){NavigatorUtils.pushPage(context, ImageUsePage());}),
      buildContainerAndClick("AssetBundle 加载图片",(){NavigatorUtils.pushPage(context, ImageUse2Page());}),
      buildContainerAndClick("图像混合模式ColorBlendMode",(){NavigatorUtils.pushPage(context, ImageColorBlendMode());}),
      buildContainerAndClick("图像填充模式",(){NavigatorUtils.pushPage(context, BoxFitBaseUsePage());}),
      buildContainerAndClick("CenterSlice",(){NavigatorUtils.pushPage(context, CenterSliceUsePage());}),

    ];
  }

  bluldLeftWidget2(BuildContext context){
    return [
      buildContainerAndClick("通过Image来加载本地资源目录asset下的图片",(){NavigatorUtils.pushPage(context, ImageLoadingAssetPage());}),
      buildContainerAndClick("通过File来加载SD卡下的图片",(){NavigatorUtils.pushPage(context, ImageLoadingFilePage());}),
      buildContainerAndClick("网络图片的缓存与加载",(){NavigatorUtils.pushPage(context, ImageCachePage());}),
      buildContainerAndClick("圆角图片",(){NavigatorUtils.pushPage(context, ImageOvalPage());}),
      buildContainerAndClick("RawImage的使用分析",(){NavigatorUtils.pushPage(context, RawImagePage());}),
      buildContainerAndClick("高斯模糊",(){NavigatorUtils.pushPage(context, BackdropImagePage());}),

      buildContainerAndClick("消失效果",(){NavigatorUtils.pushPage(context, DismissImagePage());}),

      buildContainerAndClick("widget生成图片",(){NavigatorUtils.pushPage(context, WidgetToImagePage());}),
      buildContainerAndClick("图片添加水印", () {
        ///背景透明的跳转
        Navigator.of(context)
            .push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return ImageWatermarkPage();
                }))
            .then((value) {
              if(value!=null){
                ///
                print("保存的图片地址为$value");
              }
        });
      }),
      buildContainerAndClick("Ink.image",(){NavigatorUtils.pushPage(context, WidgetToImagePage());}),


    ];
  }

}