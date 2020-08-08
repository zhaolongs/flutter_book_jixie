import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

///6 /lib/code3/main_data88.dart
/// 自定义countText的样式配置
class TextFieldCountAndSufixTextPage extends StatefulWidget {
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
              Text("请输入11位用户名"),
              buildTextFieldFunction1(),
            ],
          ),
        ));
  }


  ///最大输入的文字字数
  int maxLength =11;
  ///当前输入的字数
  int currentLength =0;

  buildTextFieldFunction1() {
    return new TextField(
      ///输入文本格式过滤
      inputFormatters: [
        ///输入的内容长度为 maxLength 位
        LengthLimitingTextInputFormatter(maxLength),
      ],
      ///输入的文本改变时回调此函数
      onChanged: (String value){
        //日志输出
        print("onChanged "+value.toString());
        //刷新当前输入的字数
        setState(() {
          currentLength=value.length;
        });

      },
      //边框样式设置
      decoration: InputDecoration(
        //counterText 使用的文本样式
        suffixStyle: TextStyle(color: Colors.blue, fontSize: 12.0),
        suffixText: "还可输入${maxLength-currentLength}字"
      ),
    );
  }
}
