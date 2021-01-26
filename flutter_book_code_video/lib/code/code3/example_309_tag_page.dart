import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

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
    home: Example309(),
  ));
}
///代码清单 3-19 防开源中国自定义底部菜单
///lib/code/code3/example_309_tag_page.dart
class Example309 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example309> {
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
        title: Text("仿开源中国底部弹出菜单"),
      ),
      body: Container(
        //文字标签流式布局
        child: BottomRoundFlowMenu(
          //图标使用的背景
          defaultBackgroundColor: Colors.white,
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