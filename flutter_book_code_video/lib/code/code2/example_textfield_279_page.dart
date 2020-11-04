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
    home: Example279(),
  ));
}

class Example279 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example279> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("文本输入框"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
          // buildTextField(),
          // buildTextField2(),
          buildTextField3(),
        ]),
      ),
    );
  }

  ///代码清单 2-79
  ///lib/code/code2/example_appbar_279_page.dart
  Widget buildTextField() {
    return TextField(
      //自动获取输入焦点
      autofocus: true,
    );
  }

  /// 文本输入框 密码 隐藏文本
  Widget buildTextField2() {
    return new TextField(
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
    );
  }

  Widget buildTextField3() {
    return new TextField(
      //输入的字数最多为 11字
      maxLength: 11,
    );
  }
}
