import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FlexMain1Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//lib/code10/main_data1016.dart
///  Flex的基本使用
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flex 布局"),
        ),
        body: Container(
            //灰色背景
            color: Colors.grey[300],
            child: Flex(
              ///指定方向
              direction: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text("文本三"),
                  color: Colors.grey[500],
                ),

                ///区域二的内容
                 Container(
                    padding: EdgeInsets.all(10),
                    child: Text("文本二"),
                    color: Colors.grey[500],
                  ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: Text("文本三"),
                  color: Colors.grey[500],
                ),
              ],
            ),)
        );
  }
}
