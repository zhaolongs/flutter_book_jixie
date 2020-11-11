import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021410098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example410(),
  ));
}

///代码清单 4-17
///lib/code/code4/example_410_imageshow_page.dart
///图片浏览器
class Example410 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example410> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片浏览器"),
      ),
      backgroundColor: Colors.white,
      body: ImageShowPageView(
        //图片数据
        imageList: [
          "assets/images/2.0x/banner1.webp",
          "assets/images/2.0x/banner2.webp",
          "assets/images/2.0x/banner3.webp",
        ],
        //图片的类型
        imageShowType: ImageShowType.ASSET,
        //图片的填充方式
        boxFit: BoxFit.contain,
      ),
    );
  }
}
