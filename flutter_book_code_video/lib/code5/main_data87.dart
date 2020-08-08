import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data87.dart
/// preText、suffixText的综合使用
class TextFieldPreTextPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "示例",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("请输入生日"),
              SizedBox(height: 0,),

              new TextField(
                //边框样式设置
                decoration: InputDecoration(
                  //最前面的图标
                  prefixText: "张三于",
                  prefixStyle: TextStyle(
                    color: Colors.blue
                  ),
                  suffixText: "出生",
                  suffixStyle: TextStyle(
                    color: Colors.blue
                  )
                ),
              ),
            ],
          ),
        ));
  }
}
