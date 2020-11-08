import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    home: Example238(),
  ));
}

///代码清单 2-85
///lib/code/code2/example_238_button_page.dart
class Example238 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example238> {

  //定义菜单按钮选项
  List<Icon> iconList = [
    Icon(Icons.add),
    Icon(Icons.save),
    Icon(Icons.share),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      //填充屏幕空间
      body: Container(
        constraints: BoxConstraints.expand(),
        //这里使用的帧布局（层叠布局）
        child: Stack(
          children: [
            //右下角对齐
            Positioned(
              right: 20,
              bottom: 20,
              //向上弹出的按钮组件
              child: RoteFloatingButton(
                //子菜单按钮选项
                iconList: iconList,
                //子菜单按钮的点击事件回调
                clickCallback: (int index) {
                  //也支持 Hero动画 按钮对应的 Tag 就是索引对应的字符串
                  print("点击了按钮$index");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
