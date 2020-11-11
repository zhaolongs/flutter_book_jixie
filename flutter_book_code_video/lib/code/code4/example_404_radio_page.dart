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
    home: Example404(),
  ));
}

class Example404 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单选框Radio"),
      ),

      body: Column(children: [
        SizedBox(height: 26,),
        buildRadioListTile(),
        SizedBox(height: 66,),
        buildRadioGroupWidget(),
      ],),
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
  ///代码清单 4-7  单选框RadioListTile组件的基本使用
  ///lib/code/code4/example_404_radio_page.dart
  Widget buildRadioListTile() {
    return RadioListTile(
      // 当前对应的单选框的标识
      value: 0,
      //是否选中发生变化时的回调， 回调的 bool 值 就是是否选中 , true 是 选中
      onChanged: (value) {
        setState(() {
          groupValue = value;
        });
      },
      // 选中时 Radio 的填充的颜色 ，
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
      groupValue: groupValue,
    );
  }
}
