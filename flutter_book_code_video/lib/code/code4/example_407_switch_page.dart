import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021407098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example407(),
  ));
}

class Example407 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example407> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开关Switch"),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Container(
            color: Colors.white,
            child: buildSwitchListTile(),
          ),
          SizedBox(
            height: 60,
          ),
          // buildSwitchWidget(),
          // buildCupertinoSwitch()
        ],
      ),
    );
  }

  ///代码清单 4-10
  ///lib/code/code4/example_407_switch_page.dart
  ///记录开关的状态
  bool switchValue = false;

  ///开关[Switch]的基本使用
  Widget buildSwitchWidget() {
    return Switch(
      //开关状态改变时的回调
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      //当前开关的状态
      value: switchValue,
      //选中时小圆滑块的颜色
      activeColor: Colors.blue,
      //选中时底部的颜色
      activeTrackColor: Colors.yellow,
      //未选中时小圆滑块的颜色
      inactiveThumbColor: Colors.deepPurple,
      //未选中时底部的颜色
      inactiveTrackColor: Colors.redAccent,
    );
  }

  ///代码清单 4-11
  ///lib/code/code4/example_407_switch_page.dart
  ///苹果风格的形状 小圆圈一直是白色的
  Widget buildCupertinoSwitch() {
    return CupertinoSwitch(
      //开关状态改变时的回调
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      //当前开关的状态
      value: switchValue,
      //选中时底部的颜色
      activeColor: Colors.blue,
      //未选中时底部的颜色
      trackColor: Colors.grey,
    );
  }

  ///代码清单 4-12
  ///lib/code/code4/example_407_switch_page.dart
  ///开关[SwitchListTile]的基本使用
  Widget buildSwitchListTile() {
    return SwitchListTile(
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
      //开关状态改变时的回调
      onChanged: (bool value) {
        setState(() {
          switchValue = value;
        });
      },
      //当前开关的状态
      value: switchValue,
      //选中时小圆滑块的颜色
      activeColor: Colors.blue,
      //选中时底部的颜色
      activeTrackColor: Colors.yellow,
      //未选中时小圆滑块的颜色
      inactiveThumbColor: Colors.deepPurple,
      //未选中时底部的颜色
      inactiveTrackColor: Colors.redAccent,
    );
  }
}
