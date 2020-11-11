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
    home: Example405(),
  ));
}

class Example405 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example405> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("复选框Checkbox"),
      ),
      body: buildCheckBox(),
    );
  }

  ///代码清单 4-7  复选框CheckBox的基本使用
  ///lib/code/code4/example_405_checkbox_page.dart
  //默认选中的单选框的值
  bool checkIsSelect = false;

 //复选框Checkbox的基本使用
  Checkbox buildCheckBox() {
    return Checkbox(
      //点击选择时的回调
      onChanged: (bool value) {
        setState(() {
          checkIsSelect = value;
        });
      },
      //为true时 Checkbos是选中状态
      //为false时 Checkbos是未选中状态
      value: checkIsSelect,
      //选中时的填充颜色
      activeColor: Colors.blue,
      //选中的小对勾的颜色
      checkColor: Colors.white,
    );
  }
}
