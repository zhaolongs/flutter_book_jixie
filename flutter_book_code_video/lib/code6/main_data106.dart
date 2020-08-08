import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data106.dart
///  Padding 使用说明
class ContainerEdgeInsetsPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7 /lib/code6/main_data106.dart
/// Padding 使用说明
class _PageState extends State {
  String str="有时候，总觉得自己的梦想很大";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "示例",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              ///代码块一
              Container(
                ///只设置左内边距
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(str),
              ),
              ///代码块二 与上述代码块一所实现的效果一致
              Padding(
                ///只设置左内边距
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(str),
              ),
              Container(
                // 分别设置left、top、right、bottom边距
                padding: const EdgeInsets.fromLTRB(40.0,.0,20.0,20.0),
                child: Text(str),
              )
          ],
        ),
      ),
    );
  }
}
