import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///6 /lib/code3/main_data91.dart
/// 主题 InputDecorationTheme 的配置使用
class TextFieldHelperTextStylePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State {
  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
           /// 帮助文本的样式
            helperStyle: TextStyle(color: Colors.deepOrange),
            helperMaxLines: 1,
            ///错误提示文本的样式
            errorStyle: TextStyle(
              color: Colors.deepOrange,
            ),
            errorMaxLines: 1,

            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12.0
            ),
            ),
      ),
      home: Scaffold(
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
                Text("请输入文本内容"),
                buildTextFieldFunction1(),
                SizedBox(
                  height: 40,
                ),
                buildTextFieldFunction2(),
              ],
            ),
          )),
    );
  }

  ///6 /lib/code3/main_data91.dart
  /// helper帮助提示语
  buildTextFieldFunction1() {
    return new TextField(
      maxLines: 3,
      minLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        //helperText 使用的文本样式
        helperStyle: TextStyle(color: Colors.blue, fontSize: 12.0),
        helperText:
            "把现在的工作做好，才能幻想将来的事情，专注于眼前的事情，对于尚未发生的事情而陷入无休止的忧虑之中，对事情毫无帮助，反而为自己凭添了烦恼",
        helperMaxLines: 1,
      ),
    );
  }

  ///6 /lib/code3/main_data91.dart
  /// errorText 错误提示语
  buildTextFieldFunction2() {
    return new TextField(
      maxLines: 3,
      minLines: 1,
      //边框样式设置
      decoration: InputDecoration(
        //errorText 使用的文本样式
        errorStyle: TextStyle(color: Colors.red, fontSize: 12.0),
        errorText:
            "把现在的工作做好，才能幻想将来的事情，专注于眼前的事情，对于尚未发生的事情而陷入无休止的忧虑之中，对事情毫无帮助，反而为自己凭添了烦恼",
        errorMaxLines: 1,
      ),
    );
  }
}
