import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///



//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example229(),
  ));
}

class Example229 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example229> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("文本输入框"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
          // buildTextField(),
          buildLoginWidget(),
        ]),
      ),
    );
  }

  ///代码清单 2-49
  ///lib/code/code2/example_229_textfield_page.dart
  ///
  Widget buildTextField() {
    return TextField(
      decoration: InputDecoration(
          //提示文本
          hintText: "请输入姓名",
          //提示文本样式
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
    );
  }

  // 设置上下左右 都有边框
  Widget buildLoginWidget() {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Column(
        children: [
          new TextField(
            //边框样式设置
            decoration: InputDecoration(
              labelText: "用户名",
              //设置上下左右 都有边框
              //设置四个角的弧度
              border: OutlineInputBorder(
                //设置边框四个角的弧度
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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
