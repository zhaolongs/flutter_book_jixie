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
    home: Example401(),
  ));
}

class Example401 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example401> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
      ),
      //垂直排列
      body: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        SizedBox(
          height: 22,
        ),
        buildCupertinoIndicator(),
        SizedBox(
          height: 42,
        ),
        buildCircularProgress(),

        SizedBox(
          height: 42,
        ),
        buildLinearProgress(),
      ],
    );
  }

  ///代码清单 4-1 线性指示器LinearProgressIndicator
  ///lib/code/code4/example_401_progress_page.dart
  Widget buildLinearProgress() {
    //Container 来约束大小
    return Container(
      width: 300,
      //会覆盖 进度条的 minHeight
      height: 10,
      child: LinearProgressIndicator(
        // value: 0.3,
        //进度高亮颜色
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        //总进度的颜色
        backgroundColor: Color(0xff00ff00),
        //设置进度条的高度
        minHeight: 10,
      ),
    );
  }

  ///代码清单 4-2 圆形指示器LinearProgressIndicator
  ///lib/code/code4/example_401_progress_page.dart
  Widget buildCircularProgress() {
    //通过Container或者SizeBox来限制大小
    return Container(
      width: 55,
      height: 55,
      child: CircularProgressIndicator(
        // value: 0.3,
        //进度高亮颜色
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
        //总进度的颜色
        backgroundColor: Color(0xff00ff00),
        //圆圈的厚度
        strokeWidth: 6.0,
      ),
    );
  }

  ///代码清单 4-3 苹果风格圆形指示器
  ///lib/code/code4/example_401_progress_page.dart
  Widget buildCupertinoIndicator() {
    //通过Container或者SizeBox来限制大小
    return Container(
      width: 85,
      height: 85,
      child: CupertinoActivityIndicator(
        //半径
        radius: 30,
        //是否转动 默认为 true 开启转动
        animating: false,
      ),
    );
  }
}
