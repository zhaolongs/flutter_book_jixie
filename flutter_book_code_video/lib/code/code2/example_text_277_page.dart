import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_216_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example277(),
  ));
}

class Example277 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example277> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("Text文本样式"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
          buildRichText(),
        ]),
      ),
    );
  }

  ///代码清单 2-77
  ///lib/code/code2/example_appbar_277_page.dart
  Widget buildRichText() {
    //参数一为显示的文本段落
    //参数二为筛选的关键词
    return RichTextTag(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        "th");
  }
}
