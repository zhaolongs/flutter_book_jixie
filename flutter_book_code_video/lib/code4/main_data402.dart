import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';

/// lib/code4/main_data402.dart
class TextWarpTagPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<TextWarpTagPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("文本标签"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30.0, left: 10, right: 10),
          ///流式布局
          child: Wrap(
              ///横向每个标签之间的距离
              spacing: 8.0,
              ///纵向每个标签之间的距离
              runSpacing: 8.0,
              ///子标签
              children: buildItemWidgetList()),
        ),);
  }

  ///文本标签集合
  List<String> tagList = ["文本标签", "测试", "这是什么", "早上好","吃饭", "再来一次"];
  ///构建文本标签数据
  buildItemWidgetList() {
    List<Widget> itemWidgetList = [];
    for (var i = 0; i < tagList.length; i++) {
      var str = tagList[i];
      itemWidgetList.add(TextTagWidget("$str"));
    }
    return itemWidgetList;
  }
}
