
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423



//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example220(),
  ));
}

///代码清单 2-38
///lib/code/code2/example_220_text_page.dart
class Example220 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example220> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("Text"),
      ),
      //页面的主内容区
      body: Container(
        //宽度填充父布局
        width: double.infinity,
        child: Column(children: [
          buildText4(),
          buildText5(),
          buildText6(),
        ],),
      ),
    );
  }

  Text buildText() {
    return Text(
      "执剑天涯，从你的点滴积累开始，所及之处，必精益求精",
      //文字在开始方向对齐
      textAlign: TextAlign.start,
      //文字方向从左向右
      textDirection: TextDirection.rtl,
    );
  }

  Text buildText2() {
    return Text(
      "执剑天涯，从你的点滴积累开始，所及之处，必精益求精",
      //文字在开始方向对齐
      textAlign: TextAlign.start,
      //文字方向从左向右
      textDirection: TextDirection.ltr,
    );
  }

  Text buildText3() {
    return Text(
      "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
      //文字在开始方向对齐
      textAlign: TextAlign.justify,
      //文字方向从左向右
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: 25),
    );
  }

  Widget buildText4() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        //设置超出的部分使用省略号
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
  Widget buildText5() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        overflow: TextOverflow.fade,
      ),
    );
  }
  Widget buildText6() {
    return Container(
      width: 300,
      child: Text(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(fontSize: 25),
        //设置是否自动换行  默认为true 自动换行
        //设置为 false 不会自动换行
        softWrap:false,
        overflow: TextOverflow.visible,
      ),
    );
  }
}
