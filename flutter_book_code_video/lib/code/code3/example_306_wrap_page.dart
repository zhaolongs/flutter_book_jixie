import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example306(),
  ));
}



class Example306 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example306> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),
      //填充屏幕空间
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: buildWrap(),
      ),
    );
  }
  ///代码清单 3-13 Row中子Widget超出视图
  ///lib/code/code3/example_306_wrap_page.dart
  Widget buildRow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      //包裹的子view
      children: [
        Container(color: Colors.blue,width: 200,height: 45,),
        Container(color: Colors.yellow,width: 200,height: 45,),
        Container(color: Colors.grey,width: 200,height: 45,),
      ],
    );
  }
  ///代码清单 3-14 Wrap 的基本使用
  ///lib/code/code3/example_306_wrap_page.dart
  Widget buildWrap(){
    return Wrap(
      //包裹的子view
      children: [
        Container(color: Colors.blue,width: 200,height: 45,),
        Container(color: Colors.yellow,width: 200,height: 45,),
        Container(color: Colors.grey,width: 200,height: 45,),
      ],
     //水平排列 默此方式
      direction: Axis.horizontal,
      //主轴方向上的两个widget之间的间距
      spacing: 12,
      // 行与行之前的间隔
      runSpacing: 10,
      //主轴方向的Widget的对齐方式
      alignment: WrapAlignment.start,
      //次轴方向上的对齐方向
      runAlignment: WrapAlignment.start,
    );
  }


 
}
