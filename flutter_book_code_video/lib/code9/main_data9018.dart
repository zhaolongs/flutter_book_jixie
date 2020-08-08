import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/5/30.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

//lib/code/main_data9018.dart
//图片添加水波纹点击事件
class ImageWatermarkPage extends StatefulWidget {
  @override
  _RawImageState createState() => _RawImageState();
}

class _RawImageState extends State<ImageWatermarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///页面背景为半透明的灰色
      backgroundColor: Color(0x50cdcdcd),
      ///页面主体
      body:buildInkWellContainer(),
    );
  }

  ///通过 InkWell 结合 Ink.image 来实现
  ///Image的水波纹点击事件
  Widget buildInkWellContainer() {
    return new Material(
      child: new Ink(
        child: new InkWell(
          onTap: (){
            print("图片点击事件");
          },
          child: new Container(
            height: 200,
            //设置child 居中
            alignment: Alignment(0, 0),
            child: Ink.image(
              image: AssetImage("assets/images/2.0x/banner1.webp",),
            ),
          ),
        ),
      ),
    );
  }

}
