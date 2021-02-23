import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021408098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example408(),
  ));
}

class Example408 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example408> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            color: Colors.white,
            child: buildGestureDetector(),
          ),
          SizedBox(
            height: 60,
          ),
          buildInkWell(),
          SizedBox(
            height: 60,
          ),
          buildInkWellContainer(),
        ],
      ),
    );
  }

  ///代码清单 4-13 手势识别[GestureDetector]的基本使用
  ///lib/code/code4/example_408_gesture_page.dart
  Widget buildGestureDetector() {
    return GestureDetector(
      //手指抬起时的回调
      onTap: () {
        print("点击了图片");
      },
      child: Container(
        width: 200,
        height: 100,
        child: Image.asset(
          "assets/images/2.0x/banner1.webp",
        ),
      ),
    );
  }

  ///代码清单 4-14
  ///lib/code/code4/example_408_gesture_page.dart
  ///手势识别[InkWell]的基本使用
  Widget buildInkWell() {
    return new InkWell(
      //水波纹执行的半径
      // radius: 30,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      //水波纹颜色配制
      splashColor: Colors.grey,
      //点击事件回调
      onTap: () {
        print("onTap 单击回调");
      },
      //需要设置点击事件的子Widget
      child: Container(
        color: Colors.black38,
        width: 100,
        height: 100,
      ),
    );
  }

  ///代码清单 4-15
  ///lib/code/code4/example_408_gesture_page.dart
  ///通过 [InkWell] 为 [Container]设置点击事件
  ///通过 [Ink] 来添加背景样式
  Widget buildInkWellContainer() {
    return new Material(
      child: new Ink(
        color: Colors.blue,
        child: new InkWell(
          //点击事件回调
          onTap: () {},
          //不要在这里设置背景色，否则会遮挡水波纹效果,
          child: buildContainer(),
        ),
      ),
    );
  }

 //常见的UI布局
  Container buildContainer() {
    return new Container(
      width: 300.0,
      height: 50.0,
      //设置child 居中
      alignment: Alignment(0, 0),
      child: Text(
        "登录",
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    );
  }
}
