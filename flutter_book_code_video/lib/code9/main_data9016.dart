
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
class WidgetToImagePage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

//lib/code/main_data9016.dart
//将widget保存为图片
class _RawImageState extends State<WidgetToImagePage> {

  GlobalKey _globalKey = GlobalKey();

  ui.Image _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("保存widget"),
      ),

      ///填充布局
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            ///可以为其子元素创建一个单独的子树
            ///相当于总树Widgets上的一个小分叉树枝
            RepaintBoundary(
              key: _globalKey,
              ///用于生成图像的Widget
              child: Container(
                color: Colors.grey,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/2.0x/friend_icon.png",
                      width: 20,
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("这里是标题"),
                        SizedBox(
                          height: 4,
                        ),
                        Text("这里是副标题标题"),
                      ],
                    )
                  ],
                ),
              ),
            ),

            RaisedButton(
              child: Text("点击保存海报"),
              onPressed: () async {
                ///通过globalkey将Widget保存为ui.Image
                _image = await ImageLoaderUtils.imageLoader.getImageFromWidget(_globalKey);
                ///更新显示在页面上
                setState(() {});
                ///异步将这张图片保存在手机内部存储目录下
                ImageUtils.imageUtils.saveImageByUIImage(_image,isEncode: false);
              },
            ),
            ///用于显示通过Widget生成的图像
            RawImage(
              image: _image,
            ),
          ],
        ),
      ),
    );
  }
}
