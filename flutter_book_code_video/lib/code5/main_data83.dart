import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';


/**
 *  限制输入框内输入文本的内容
 */
class TextFieldContentPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data83.dart
/// 限制输入的内容
class _PageState extends State {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "内容输入限制",
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("输入数字"),
            buildBodyFunction(),

            SizedBox(height: 20,),
            Text("输入字母"),
            buildBodyFunction2(),
            SizedBox(height: 20,),
            Text("输入字母和数字"),
            buildBodyFunction3(),

            SizedBox(height: 20,),
            Text("验证用户密码"),
            buildBodyFunction4(),

            SizedBox(height: 20,),
            Text("输入点后自动补0"),
            buildBodyFunction6(),

          ],),));
  }

  ///6 /lib/code3/main_data83.dart
  /// 限制只能输入数字
  buildBodyFunction() {
    return new TextField(
      ///设置键盘的类型
      keyboardType: TextInputType.phone,
      ///输入文本格式过滤
      inputFormatters: [
        ///输入的内容长度为11位
        LengthLimitingTextInputFormatter(11),
        ///只允许输入数字
        WhitelistingTextInputFormatter.digitsOnly
      ],
     );
  }
  ///6 /lib/code3/main_data83.dart
  /// 限制只能输入字母
  buildBodyFunction2() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: [
        ///使用正则过滤
        WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
      ],
    );
  }

  ///6 /lib/code3/main_data83.dart
  /// 限制只能输入字母和数字
  buildBodyFunction3() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: [
        ///使用正则过滤
        WhitelistingTextInputFormatter(RegExp("[A-Za-z0-9]")),
      ],
    );
  }
  ///6 /lib/code3/main_data83.dart
  ///限制单行
  buildBodyFunction4() {
    return new TextField(
      ///设置最大行数为3行
      maxLines: 3,
      ///输入文本格式过滤
      inputFormatters: [
        ///限制单行
       BlacklistingTextInputFormatter.singleLineFormatter,
      ],
    );
  }
  ///6 /lib/code3/main_data83.dart
  ///输入邮箱控制
  buildBodyFunction5() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: [
        WhitelistingTextInputFormatter(RegExp("[@]|[A-Za-z0-9]|[.]")),
      ],
    );
  }
  ///6 /lib/code3/main_data83.dart
  ///使用自定义的TextInputFormatter
  buildBodyFunction6() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: [
        CustomInputFormatter(),
      ],
    );
  }
}
///6 /lib/code3/main_data83.dart
// 限制小数位数
class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;
    int selectionIndex = newValue.selection.end;
    if(value=="."){
      value ="0.";
      selectionIndex++;
    }
    return new TextEditingValue(
      text: value,
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }

}
