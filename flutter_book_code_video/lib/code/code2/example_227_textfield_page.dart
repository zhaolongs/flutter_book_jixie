import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example227(),
  ));
}

class Example227 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example227> {
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
          // buildTextField2(),
          //buildTextField3(),
          buildTextField8(),
        ]),
      ),
    );
  }

  ///代码清单 2-45 文本输入框
  ///lib/code/code2/example_227_textfield_page.dart
  Widget buildTextField() {
    return TextField(
      //自动获取输入焦点
      autofocus: true,
    );
  }

  /// 文本输入框 密码 隐藏文本
  Widget buildTextField2() {
    return new TextField(
      //隐藏输入的文本
      obscureText: true,
      //最大可输入1行
      maxLines: 1,
    );
  }

  Widget buildTextField3() {
    return new TextField(
      //输入的字数最多为 11字
      maxLength: 11,
    );
  }

  // 字数输入限制
  // 实现方式二   右下角不会有文字计数器
  Widget buildTextField4() {
    return new TextField(
      //输入文本格式过滤
      inputFormatters: <TextInputFormatter>[
        //当长度大于11的时候就不允许再输入了
        LengthLimitingTextInputFormatter(11)
      ],
    );
  }

  // 限制只能输入数字
  Widget buildTextField5() {
    return new TextField(
      //设置键盘的类型
      keyboardType: TextInputType.phone,
      //输入文本格式过滤
      inputFormatters: [
        //输入的内容长度为11位
        LengthLimitingTextInputFormatter(11),
        //只允许输入数字
        WhitelistingTextInputFormatter.digitsOnly
      ],
    );
  }

  // 限制只能输入字母 正则过滤
  Widget buildTextField6() {
    return new TextField(
      //输入文本格式过滤
      inputFormatters: [
        //使用正则过滤
        WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
      ],
    );
  }

  //限制单行
  Widget buildTextField7() {
    return new TextField(
      //设置最大行数为3行
      maxLines: 3,
      //输入文本格式过滤
      inputFormatters: [
        //限制单行
        BlacklistingTextInputFormatter.singleLineFormatter
      ],
    );
  }

  //输入邮箱控制
  Widget buildTextField8() {
    return new TextField(
      //输入文本格式过滤
      inputFormatters: [
        WhitelistingTextInputFormatter(RegExp("[@]|[A-Za-z0-9]|[.]")),
      ],
    );
  }
}
