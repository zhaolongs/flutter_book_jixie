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
///lib/code/code2/example_207_scaffold_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example281(),
  ));
}

class Example281 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example281> {
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
          buildTextField3(),
        ]),
      ),
    );
  }

  ///代码清单 2-81
  ///lib/code/code2/example_appbar_281_page.dart
  ///
  ///设置无边框
  Widget buildTextField() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        //设置无边框
        border: InputBorder.none,
      ),
    );
  }

  // 设置上下左右 都有边框
  Widget buildTextField2() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        //设置上下左右 都有边框
        //设置四个角的弧度
        border: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  ///代码清单 2-86
  ///lib/code/code2/example_appbar_281_page.dart
  // 只有下边框  配置自定义的边框颜色
  Widget buildTextField3() {
    return new TextField(
      //输入字数限制
      maxLength: 5,
      //超出字数限制后仍然可输入
      maxLengthEnforced: false,
      //激活状态
      enabled: true,
      //为true时为只读
      readOnly: false,
      //边框样式设置
      decoration: InputDecoration(
        //只有下边框  配置自定义的边框颜色
        border: UnderlineInputBorder(),
        //设置输入框可编辑时的边框样式
        //可理解为enabled为true时，就是当前的输入框为激活状态时
        enabledBorder: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //用来配置边框的样式
          borderSide: BorderSide(
            //设置边框的颜色
            color: Colors.blueGrey,
            //设置边框的粗细
            width: 2.0,
          ),
        ),

        //输入框不可编辑时显示的边框样式
        //可理解为enabled为false时，就是当前的输入框为 未激活状态时
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        //输入框错误提示边框样式
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        //用来配置输入框获取焦点时的边框样式
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
      ),
    );
  }

}
