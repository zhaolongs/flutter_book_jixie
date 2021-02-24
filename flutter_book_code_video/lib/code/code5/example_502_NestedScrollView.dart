import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example502(),
  ));
}


class Example502 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example502State();
  }
}
///代码清单 5-6 NestedScrollView 的基本使用
///lib/code/code5/example_502_NestedScrollView.dart
class _Example502State extends State<Example502> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NestedScrollView"),
      ),
      body: NestedScrollView(
        //配置可折叠的头布局
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text("标题"),
              //标题居中
              centerTitle: true,
            )
          ];
        },
        //超出显示内容区域的Widget
        body: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          height: 1600,
          child: Text("测试数据"),
        ),
      ),
    );
  }
}
