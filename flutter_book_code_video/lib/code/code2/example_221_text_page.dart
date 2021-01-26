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
///
///


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example221(),
  ));
}


class Example221 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example221> {
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
        child: Column(
          children: [
            buildText(),
          ],
        ),
      ),
    );
  }
  ///代码清单 2-39  常用文本样式配置描述
  ///lib/code/code2/example_221_text_page.dart
  Widget buildText() {
    return Container(
      child: Text(
        "执剑天涯，从你的点滴积累开始，所及之处，必精益求精 Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        style: TextStyle(
          //文字大小
          fontSize: 25,
          //设置文字的粗细规则为常规体
          fontWeight: FontWeight.normal,
          //设置文字为斜体
          fontStyle: FontStyle.italic,
          //字符与字符之间的间隔
          letterSpacing: 12.0,
          //单词之间的间隔
          wordSpacing: 20.0,
        ),
      ),
    );
  }
}
