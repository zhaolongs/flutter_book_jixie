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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example305(),
  ));
}



class Example305 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Example305State();
  }
}
///代码清单 3-12 Stack 的基本使用
///lib/code/code3/example_305_column_page.dart
class _Example305State extends State<Example305> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      //填充屏幕空间
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: buildStack2(),
      ),
    );
  }
  ///代码清单 3-11 Stack 的基本使用
  ///lib/code/code3/example_305_column_page.dart
  Stack buildStack() {
    return Stack(
      //默认的子Widget对齐方式为左上角
      alignment: AlignmentDirectional.topStart,
      children: [
        RaisedButton(onPressed: () {  },child: Text("A"),),
        OutlineButton(onPressed: () {  },child: Text("B"),),
        ElevatedButton(onPressed: () {  },child: Text("C"),),
      ],
    );
  }

  Stack buildStack2(){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          child: Text("文本一", style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          top: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("文本二", style: TextStyle(color: Colors.white)),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.blue,
            child: Text("文本三", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

 
}
