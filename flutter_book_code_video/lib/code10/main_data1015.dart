import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RowMain2Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//lib/code10/main_data1015.dart
///  Row线性布局 权重适配
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局 Row"),
        ),
        body: Container(
            //灰色背景
            color: Colors.white,
            //创建 Row  实现 Row 中子布局的垂直（竖直）排列
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ///区域一的内容
                    Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text("文本二"),
                      color: Colors.grey[300],
                    ),

                    ///区域二的内容
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("严于律己，精于行动，点滴积累，着眼未来，你也许不负青春"),
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
