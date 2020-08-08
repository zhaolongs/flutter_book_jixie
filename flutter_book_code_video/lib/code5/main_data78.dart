import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/**
 *  文本输入框的基本使用
 */
class TextFieldCapitalization extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data78.dart
/// 文本输入框 密码
class _PageState extends State<TextFieldCapitalization> {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "文本输入框基本使用"
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: buildBodyFunction(),));
  }
  ///6 /lib/code3/main_data78.dart
  /// 文本输入框 字母大写规则配置
  buildBodyFunction() {
    return Column(children: [
      new TextField(
        ///设置键盘的类型
        keyboardType: TextInputType.visiblePassword,
        ///输入的文本中的英文字符全部大写
        textCapitalization: TextCapitalization.characters,
      ),
      new TextField(
        ///输入的文本中的每个句子的第一个字母被转换成大写
        textCapitalization: TextCapitalization.sentences,
      ),
      new TextField(
        ///输入的文本中 对每个单词首字母大写
        textCapitalization: TextCapitalization.words,
      ),
    ],);
  }
}