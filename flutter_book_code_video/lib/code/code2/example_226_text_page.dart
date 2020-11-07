import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///




//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example226(),
  ));
}

class Example226 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example226> {
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

  ///代码清单 2-44
  ///lib/code/code2/example_226_text_page.dart
  Widget buildRichText() {
    //参数一为显示的文本段落
    //参数二为筛选的关键词
    return RichTextTag(
        "Sometimes the thing you're searching  for your whole life, it's right there by your side all along.",
        "th");
  }
}