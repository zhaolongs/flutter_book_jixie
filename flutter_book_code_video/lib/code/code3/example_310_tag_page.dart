import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

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
    home: Example310(),
  ));
}

///代码清单 3-20 垂直向上弹出的动画菜单
///lib/code/code3/example_310_tag_page.dart
class Example310 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example310> {
  ///构建菜单所使用到的图标
  List<Icon> iconList = [
    Icon(
      Icons.android,
      color: Colors.blue,
      size: 18,
    ),
    Icon(
      Icons.image,
      color: Colors.red,
      size: 18,
    ),
    Icon(
      Icons.find_in_page,
      color: Colors.orange,
      size: 18,
    ),
    Icon(Icons.add, color: Colors.lightGreenAccent, size: 28),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("垂直向上弹出菜单"),
      ),
      body: Container(
        //文字标签流式布局
        child: RoteFlowButtonMenu(
          //图标使用的背景
          defaultBackgroundColor: Colors.deepOrangeAccent,
          //菜单所有的图标
          iconList: iconList,
          //对应菜单项点击事件回调
          clickCallBack: (int index) {
            print("点击了 $index");
          },
        ),
      ),
    );
  }
}
