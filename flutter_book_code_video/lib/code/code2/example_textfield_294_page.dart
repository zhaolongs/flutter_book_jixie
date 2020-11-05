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
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example294(),
  ));
}

class Example294 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example294> {
  ///代码清单 2-94
  ///lib/code/code2/example_appbar_294_page.dart
  ///
  //创建文本控制器实例
  //创建方式一
  TextEditingController _editingController = new TextEditingController();

  //创建方式二 其中 text 是预设置的内容
  TextEditingController _controller2 = new TextEditingController(text: "初始化内容");

  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: buildTextField(),
    );
  }

  buildTextField() {
    return new TextField(
      //绑定控制器
      controller: _editingController,
    );
  }

  ///代码清单 2-94
  ///lib/code/code2/example_appbar_294_page.dart
  // 设置TextField中显示的内容并保持输入光标在文本最后面
  void setEditeInputTextAndSelectionFunction(String flagText) {
    //控制 初始化的时候鼠标保持在文字最后
    _editingController = TextEditingController.fromValue(
      //用来设置初始化时显示
      TextEditingValue(
        //用来设置文本 controller.text = "0000"
        text: flagText,
        //设置光标的位置
        selection: TextSelection.fromPosition(
          //用来设置文本的位置
          TextPosition(
              affinity: TextAffinity.downstream,
              // 光标向后移动的长度
              offset: flagText.length),
        ),
      ),
    );
  }

  ///代码清单 2-95
  ///lib/code/code2/example_appbar_294_page.dart
  ///在页面初始化时调用
  @override
  void initState() {
    super.initState();
    addListener();
  }
  // 最好是在initState方法中调用
  void addListener(){
    // 添加兼听 当TextFeild 中内容发生变化时 回调 焦点变动 也会触发
    // TextField的onChanged方法当TextFeild文本发生改变时才会回调
    _editingController.addListener((){
      //获取输入的内容
      String currentStr = _editingController.text;
    });
  }

}
