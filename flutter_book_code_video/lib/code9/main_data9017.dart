import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbookcode/utils/image_loader_utils.dart';
import 'package:flutterbookcode/utils/image_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data9017.dart
//图片添加水印
class ImageWatermarkPage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

class _RawImageState extends State<ImageWatermarkPage> {
  ///生成图像的层叠布局Stack的主键
  GlobalKey _globalKey = GlobalKey();
  ///正在保存中
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///页面背景为半透明的灰色
      backgroundColor: Color(0x50cdcdcd),
      ///填充布局
      body:Stack(
        ///约束未设置位置的子Widget剧中对齐
        alignment: Alignment.center,
        children: [
          ///生成目标图像的图片与水印部分
          buildWaterImageWidget(),
          ///保存水印图片的操作部分
          buildSaveWidget(),
          ///取消操作的部分
          buildCancleWidget(),
          ///正在保存图像时显示的进度
          buildLoadingWidget(),
        ],
      ),
    );
  }
  //lib/code/main_data9017.dart
  ///正在保存图像时显示的进度
  ///一个小圆圈
  Widget buildLoadingWidget() {
    return isSaving?CircularProgressIndicator():Container();
  }
  //lib/code/main_data9017.dart
  ///取消操作的部分
  Widget buildCancleWidget() {
    return  Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(Icons.clear,color: Colors.red,size: 33,),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
  //lib/code/main_data9017.dart
  ///保存水印图片的操作部分
  Widget buildSaveWidget() {
    ///小对勾按钮显示在右上角
    return Positioned(
      top: 40,
      right: 20,
      child: IconButton(
        icon: Icon(Icons.check_circle,color: Colors.blue,size: 33,),
        onPressed: () async {
          ///更新页面显示
          setState(() {
            isSaving = true;
          });
          ///通过globalkey将Widget保存为ui.Image
          ui.Image _image = await ImageLoaderUtils.imageLoader
              .getImageFromWidget(_globalKey);

          ///异步将这张图片保存在手机内部存储目录下
          String localImagePath =  await ImageUtils.imageUtils
              .saveImageByUIImage(_image, isEncode: false);
          ///保存完毕后关闭当前页面并将保存的图片路径返回到上一个页面
          Navigator.of(context).pop(localImagePath);
        },
      ),
    );
  }
  //lib/code/main_data9017.dart
  ///生成目标图像的图片与水印部分
  Widget buildWaterImageWidget() {
    ///可以为其子元素创建一个单独的子树
    ///相当于总树Widgets上的一个小分叉树枝
    return RepaintBoundary(
      key: _globalKey,
      ///用于生成图像的Widget
      child: Container(
        ///全屏显示
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/2.0x/s03.jpeg",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            ///右下角的水印部分
            Positioned(
              bottom: 20,right: 20,
              child: Container(
                padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                decoration:
                BoxDecoration(border: Border.all(
                    color: Colors.red,
                    width: 1.0
                )),
                child: Text("这里是水印",style: TextStyle(fontSize: 14,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
