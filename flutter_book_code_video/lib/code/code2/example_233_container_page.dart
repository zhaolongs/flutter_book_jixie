import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    home: Example233(),
  ));
}

///代码清单 2-54
///lib/code/code2/example_233_container_page.dart
class Example233 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example233> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        //容器的高度
        height: 200,
        //容器的宽度
        width: 200,
        //内边距
        padding: EdgeInsets.all(20),
        //外边距
        margin: EdgeInsets.all(20),
        //当前容器的背景颜色
        color: Colors.grey,

        child: Container(
          //当前容器的子Widget居中
          alignment: Alignment.center,
          //填充父布局
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Text("内容文本"),
        ),
      ),
    );
  }
}
