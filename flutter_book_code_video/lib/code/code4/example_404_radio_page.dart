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
    home: Example403(),
  ));
}


class Example403 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example403> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框Radio"),
      ),
      body: buildRadioGroupWidget(),
    );
  }

  ///代码清单 4-6  单选框Radio组件的基本使用
  ///lib/code/code4/example_404_radio_page.dart
  //默认选中的单选框的值
  int groupValue = 0;

  //单选框的成组使用
  Row buildRadioGroupWidget() {
    return Row(children: [
      Radio(
        //此单选框绑定的值 必选参数
        value: 0,
        //当前组中这选定的值  必选参数
        groupValue: groupValue,
        //点击状态改变时的回调 必选参数
        onChanged: (v) {
          setState(() {
            this.groupValue = v;
          });
        },
      ),
      Radio(
        //此单选框绑定的值 必选参数
        value: 1,
        //当前组中这选定的值  必选参数
        groupValue: groupValue,
        //点击状态改变时的回调 必选参数
        onChanged: (v) {
          setState(() {
            this.groupValue = v;
          });
        },
      ),
    ]);
  }
}
