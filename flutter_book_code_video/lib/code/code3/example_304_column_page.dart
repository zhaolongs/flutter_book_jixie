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
    home: Example304(),
  ));
}


class Example304 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example304> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      //水平排列
      body: Container(
        width: 400,
        height: 200,
        // child: buildRow4(),
        // child:buildRow3(),
        // child: buildRow2(),
       // child: buildRow(),
       //  child: buildColumn(),
       //  child: buildColumn2(),
       //  child: buildColumn4(),
        child: buildColumn5(),
      ),
    );
  }

  Row buildRow() {
    return Row(
      children: [
        RaisedButton(onPressed: () {  },child: Text("A"),),
        OutlineButton(onPressed: () {  },child: Text("B"),),
        ElevatedButton(onPressed: () {  },child: Text("C"),),
      ],
    );
  }
  ///代码清单 3-4 Column Row 中默认的对齐方式
  ///lib/code/code3/example_304_column_page.dart
  Column buildColumn() {
    //垂直方向的线性排列
    return Column(
      //默认开始位置对齐 在国内 也就是左对齐
      mainAxisAlignment: MainAxisAlignment.start,
      //默认居中对齐
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text("从你的点滴积累开始"),
        Text("所及之处"),
        Text("必精益求精"),
      ],
    );
  }

  ///代码清单 3-5 Column 中子Widget中心对齐
  ///lib/code/code3/example_304_column_page.dart
  Column buildColumn2() {
    //垂直方向的线性排列
    return Column(
      //主轴方向居中对齐（对于Column来讲就是垂直方向）
      mainAxisAlignment: MainAxisAlignment.center,
      //交叉轴方向居中对齐（对于Column来讲就是水平方向）
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text("从你的点滴积累开始"),
        Text("所及之处"),
        Text("必精益求精"),
      ],
    );
  }

  ///代码清单 3-6 Row 中子Widget中心对齐
  ///lib/code/code3/example_304_column_page.dart
  Row buildRow2() {
    //垂直方向的线性排列
    return Row(
      //主轴方向居中对齐（对于Row来讲就是水平方向）
      mainAxisAlignment: MainAxisAlignment.center,
      //交叉轴方向居中对齐（对于Row来讲就是垂直方向）
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        RaisedButton(onPressed: () {  },child: Text("A"),),
        OutlineButton(onPressed: () {  },child: Text("B"),),
        ElevatedButton(onPressed: () {  },child: Text("C"),),
      ],
    );
  }

  ///代码清单 3-7 Row 中子Widget 填充剩余空间
  ///lib/code/code3/example_304_column_page.dart
  Widget buildRow3() {
    return Container(
      //边框
      decoration: BoxDecoration(border: Border.all()),
      //垂直方向的线性排列
      child: Row(
        //主轴方向居中对齐（对于Row来讲就是水平方向）
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {  },child: Text("A"),),
          ElevatedButton(onPressed: () {  },child: Text("B"),),
        ],
      ),
    );
  }

  ///代码清单 3-8 Row 中子Widget 填充剩余空间
  ///lib/code/code3/example_304_column_page.dart
  Widget buildRow4() {
    return Container(
      //边框
      decoration: BoxDecoration(border: Border.all()),
      //水平方向的线性排列
      child: Row(
        //主轴方向居中对齐（对于Row来讲就是水平方向）
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {  },child: Text("A"),),
          //填充
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("B"),
            ),
          ),
        ],
      ),
    );
  }

  ///代码清单 3-9 Column 中子Widget 填充剩余空间
  ///lib/code/code3/example_304_column_page.dart
  Widget buildColumn4() {
    return Container(
      //边框
      decoration: BoxDecoration(border: Border.all()),
      //垂直方向的线性排列
      child: Column(
        //主轴方向居中对齐（对于Row来讲就是水平方向）
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(onPressed: () {  },child: Text("A"),),
          //填充
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("B"),
            ),
          ),
        ],
      ),
    );
  }

  ///代码清单 3-10 Column 中子Widget 等比例排列
  ///lib/code/code3/example_304_column_page.dart
  Widget buildColumn5() {
    return Container(
      //边框
      decoration: BoxDecoration(border: Border.all()),
      //垂直方向的线性排列
      child: Column(
        children: [
          //布局1
          Expanded(flex: 1,child: Container(color: Colors.blue,),),
          //布局2
          Expanded(flex: 1,child: Container(color: Colors.grey,),),
          //布局3
          Expanded(flex: 1,child: Container(color: Colors.yellow,),),
        ],
      ),
    );
  }
}
