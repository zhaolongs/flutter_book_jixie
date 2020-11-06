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
///lib/code/code2/example_scaffold_207_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookcode/demo/rich_text_tag.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example2115(),
  ));
}

///代码清单 2-100
///lib/code/code2/example_appbar_2115_page.dart
class Example2115 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example2115> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        padding: EdgeInsets.all(20),
        //容器的高度
        height: double.infinity,
        child: Column(
          children: [
            buildBorder(),
            //buildRadial()
          ],
        ),
      ),
    );
  }

  ///代码清单 2-115
  ///lib/code/code2/example_appbar_2115_page.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过Border来创建边框样式
  Container buildBorder() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        //填充的颜色
        color: Colors.grey,
        //通过Border来构建边框装饰样式
        shape: Border.all(
            //边框的颜色
            color: Colors.red,
            //取值BorderStyle.solid表示显示边框装饰样式
            //取值BorderStyle.none表示不显示边框装饰样式
            style: BorderStyle.solid,
            //边框的宽度
            width: 4),
      ),
    );
  }
}
