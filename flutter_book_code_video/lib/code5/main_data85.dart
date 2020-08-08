import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data85.dart
/// 描述文本labelText的配置使用
class TextFieldLabelTextPage extends StatefulWidget {
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
            "登录",
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              new TextField(
                //边框样式设置
                decoration: InputDecoration(
                  labelText: "用户名",

                  ///设置上下左右 都有边框
                  ///设置四个角的弧度
                  border: OutlineInputBorder(
                    ///设置边框四个角的弧度
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              new TextField(
                //隐藏输入的文本
                obscureText: true,
                //最大可输入1行
                maxLines: 1,
                //边框样式设置
                decoration: InputDecoration(
                  labelText: "密码",
                  labelStyle: TextStyle(color: Colors.red,),
                  hintStyle:  TextStyle(color: Colors.blue,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.deepPurple)),
                ),
              ),
            ],
          ),
        ));
  }
}
