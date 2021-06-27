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
    home: Example406(),
  ));
}

class Example406 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example406> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("复选框Checkbox"),
      ),
      body: Container(margin: EdgeInsets.only(top: 20),child: buildCheckBox()),
    );
  }

  ///代码清单 4-9    //复选框CheckboxListTile的基本使用
  ///lib/code/code4/example_406_checkbox_page.dart
  //默认选中的单选框的值
  bool checkIsSelect = false;

  Widget buildCheckBox() {
    return CheckboxListTile(
      // 当前对应的复选框是否选中
      value: checkIsSelect,
      //是否选中发生变化时的回调， 回调的 bool 值 就是是否选中 , true 是 选中
      onChanged: (value) {
        setState(() {
          checkIsSelect = value;
        });
      },
      // 选中时 checkbox 的填充的颜色 ，
      activeColor: Colors.red,
      // 标题， selected 如果是 true
      // 如果 不设置 text 的 color 的话，
      // text的颜色使用activeColor
      title: Text(
        "标题",
      ),
      // 副标题（在 title 下面）
      subtitle: Text("副标题"),
      //是否是三行文本
      //如果是 true 副标题 不能为 null
      //如果是 false 如果没有副标题
      // 就只有一行， 如果有副标题 ，就只有两行
      isThreeLine: true,
      // 是否密集垂直
      dense: false,
      // 左边的控件
      secondary: Image.asset(
        "assets/images/2.0x/logo.jpg",
        fit: BoxFit.fill,
      ),
      // text 和 icon 的 color 是否 是 activeColor 的颜色
      selected: false,
      //方向模型
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
