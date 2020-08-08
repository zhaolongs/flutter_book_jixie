import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code7/main_data7016.dart
///BackButton
class PopupMenuButtonPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

//lib/code7/main_data7016.dart
class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButton"),
      ),
      backgroundColor: Colors.white,
      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              ///创建小弹框
              dividerPopMenu(),
            ],
          )),
    );
  }

  Widget baseUsePopMenu() {
    return  PopupMenuButton(
      ///通过build来构建子菜单
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<String>>[
          PopupMenuItem<String>(
            child: Text("文本一"),
            value: "value1",
          ),
          PopupMenuItem<String>(
            child: Text("文本二"),
            value: "value2",
          ),
        ];
      },
    );
  }
  //lib/code7/main_data7016.dart
  //设置弹框的偏移量
  Widget dividerPopMenu() {
    return new PopupMenuButton<String>(
        ///设置小弹框的偏移量
      ///在这里是x轴方向的偏移量为0
      ///y轴方向的偏移量为向下偏移为100
        offset: Offset(0, 100),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

          PopupMenuItem<String>(
            child: Text("文本一"),
            value: "value1",
          ),
          new PopupMenuDivider(height: 1.0),

          PopupMenuItem<String>(
            child: Text("文本二"),
            value: "value2",
          ),
          new PopupMenuDivider(height: 1.0),
          PopupMenuItem<String>(
            child: Text("文本三"),
            value: "value3",
          ),
        ],
        ///点击子菜单的回调
        onSelected: (String value) {
        });
  }
}
