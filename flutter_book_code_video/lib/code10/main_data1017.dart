
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexMain2Page extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//lib/code10/main_data1017.dart
///  Flexible和 Expanded的区别
class _MyHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("布局 "),
        ),
        body:    Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///区域一的内容
            Container(
              padding: EdgeInsets.all(10),
              child: Text("文本二"),
              color: Colors.grey[300],
            ),
            ///区域二的内容
            Flexible(
              flex: 1,
              child: Container(
                width: 120,
                padding: EdgeInsets.all(10),
                child: Text("严于律己，精于行动，点滴积累，着眼未来，你也许不负青春"),
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
    );
  }
}
