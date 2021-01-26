import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example239(),
  ));
}

class Example239 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example239> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      //填充屏幕空间
      body: buildProgressButton(),
    );
  }

  ///代码清单 2-86 ProgressButton 的基本使用
  ///lib/code/code2/example_239_button_page.dart
  Widget buildProgressButton() {
    return ProgressButton(
      //默认显示的内容
      defaultWidget: Text(
        '登录',
        style: TextStyle(color: Colors.white),
      ),
      //加载中的显示内容
      progressWidget: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
      width: 196,
      height: 40,
      //按钮的点击事件
      onPressed: () async {
        //这里用来执行异步的耗时操作
        //例如这里模拟的3000毫秒
        int score =
            await Future.delayed(const Duration(milliseconds: 3000), () => 42);
        //结束动画
        return true;
      },
    );
  }
}
