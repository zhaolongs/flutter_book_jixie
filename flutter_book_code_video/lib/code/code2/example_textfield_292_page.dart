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
    home: Example292(),
  ));
}

///代码清单 2-92
///lib/code/code2/example_appbar_292_page.dart
class Example292 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example292> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        //线性布局竖起直方向的线性排列
        child: Column(
          children: [
            new TextField(
              //边框样式设置
              decoration: InputDecoration(
                labelText: "用户名",
                //设置上下左右 都有边框
                //设置四个角的弧度
                border: OutlineInputBorder(
                  //设置边框四个角的弧度
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            new TextField(
              //隐藏输入的文本
              obscureText: true,
              //最大可输入1行
              maxLines: 1,
              //边框样式设置
              decoration: InputDecoration(
                //提示语
                labelText: "密码",
                border: OutlineInputBorder(
                  //边框圆角
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
