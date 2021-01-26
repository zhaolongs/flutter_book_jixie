import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example241(),
  ));
}

class Example241 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example241> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      //填充屏幕空间
      body: Column(
        children: [
          buildImage(),
        ],
      ),
    );
  }

  ///代码清单 2-88 Image.network 加载网络图片
  ///lib/code/code2/example_241_image_page.dart
  String imageUrl = "https://img-blog.csdnimg.cn/20201031094959816.gif";

  Widget buildImage() {
    return Image.network(
      imageUrl,
      //图片的填充模式
      fit: BoxFit.fill,
      //图片的宽高
      width: 100,
      height: 100,
      //加载中的占位
      loadingBuilder: (
        BuildContext context,
        Widget child,
        loadingProgress,
      ) {
        return Text("加载中");
      },
      //加载出错
      errorBuilder: (
        BuildContext context,
        Object error,
        stackTrace,
      ) {
        return Text("加载出错");
      },
    );
  }

  ///代码清单 2-89 Image.network 加载网络图片
  ///lib/code/code2/example_241_image_page.dart
  Widget buildImage2() {
    return Image(
      fit: BoxFit.fill,
      width: 100,
      height: 100,
      image: NetworkImage(imageUrl),
    );
  }

  ///代码清单 2-90 Image.asset 加载资源目录图片
  ///lib/code/code2/example_241_image_page.dart
  Widget buildImage3() {
    return Image.asset(
      "assets/images/banner_mang.png",
    );
  }

  //或者是
  Widget buildImage4() {
    return Image(
      image: AssetImage(
        "assets/images/banner_mang.png",
      ),
    );
  }
}
