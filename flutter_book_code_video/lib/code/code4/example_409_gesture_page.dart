import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdragscalewidget/flutterdragscalewidget.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021409098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example409(),
  ));
}

///代码清单 4-15
///lib/code/code4/example_409_gesture_page.dart
///手势识别  双击放大、双指缩放、拖动图片 依赖库使用
class Example409 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example409> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放、拖动图片"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        //缩放拖动组件
        child: DragScaleContainer(
          //双击放大
          doubleTapStillScale: true,
          //需要操作的子组件
          child: Container(
            width: 260,
            height: 260,
            child: Image.asset(
              "assets/images/2.0x/banner1.webp",
              fit: BoxFit.fill,
            ),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
