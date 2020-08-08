import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///7 /lib/code6/main_data105.dart
///  EdgeInsets 边界配置说明
class ContainerEdgeInsetsPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

///7 /lib/code6/main_data105.dart
/// Container 边界配置说明
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
              Container(
                ///只设置左内边距
                padding: const EdgeInsets.only(left: 22.0),
                child: Text(str),
              ),
              Container(
                //参数一 设置上下边距分别为20
                padding: const EdgeInsets.symmetric(vertical: 28.0),
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
