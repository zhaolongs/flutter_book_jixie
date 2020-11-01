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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'custom_tab.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example273(),
  ));
}

class Example273 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example273> {
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
          buildAnimatedDefaultTextStyle(),
          OutlineButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Text("切换样式"),
          )
        ]),
      ),
    );
  }

  ///代码清单 2-73
  ///lib/code/code2/example_appbar_273_page.dart
  bool isSelected = false;

  //构建动画样式组件
  Widget buildAnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      //设置Text中的文本样式
      //每当样式有改变时会以动画的方式过渡切换
      style: isSelected
          ? TextStyle(
              fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold)
          : TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w100),
      //动画切换的时间
      duration: const Duration(milliseconds: 200),
      //动画执行插值器
      curve: Curves.bounceInOut,
      //文本对齐方式
      textAlign: TextAlign.start,
      //文本是否应该在软换行符处换行
      softWrap: true,
      //超过文本行数区域的裁剪方式
      //设置设置为省略号
      overflow: TextOverflow.ellipsis,
      //最大显示行数
      maxLines: 1,
      //每当样式有修改触发动画时
      //动画执行结束的回调
      onEnd: () {
        print("动画执行结束");
      },

      //文本组件
      child: Text("Hello, Flutter"),
    );
  }
}
