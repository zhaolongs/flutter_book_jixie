import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


/**
 *  输入框边框样式
 */
class TextFieldDecPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}


///6 /lib/code3/main_data84.dart
///输入框边框样式
class _PageState extends State {

  @override
  Widget build(BuildContext context) {
    return buildMainBody();
  }

  Widget buildMainBody() {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "输入边框样式",
          ),),
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(children: [
            Text("无边框"),
            buildBodyFunction(),

            SizedBox(height: 40,),
            Text("上下左右 都有边框"),
            buildBodyFunction2(),
            SizedBox(height: 40,),
            buildBodyFunction4(),
            SizedBox(height: 40,),
            Text("只有下边框  默认使用的就是下边框"),
            buildBodyFunction3(),

            SizedBox(height: 40,),
            Text("只有下边框  自定义边框颜色"),
            SizedBox(height: 30,),
            buildBodyFunction5(),



          ],),));
  }

  ///6 /lib/code3/main_data84.dart
  /// 设置无边框
  buildBodyFunction() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        ///设置无边框
        border: InputBorder.none,
      ),
    );
  }
  ///6 /lib/code3/main_data84.dart
  /// 设置上下左右 都有边框
  buildBodyFunction2() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        ///设置上下左右 都有边框
        border: OutlineInputBorder(
        ),
      ),
    );
  }
  ///6 /lib/code3/main_data84.dart
  /// 设置上下左右 都有边框
  buildBodyFunction4() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        ///设置上下左右 都有边框
        ///设置四个角的弧度
        border: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }
  ///6 /lib/code3/main_data84.dart
  /// 只有下边框  默认使用的就是下边框
  buildBodyFunction3() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        ///只有下边框  默认使用的就是下边框
        border: UnderlineInputBorder(
        ),
      ),
    );
  }

  ///6 /lib/code3/main_data84.dart
  /// 只有下边框  配置自定义的边框颜色
  buildBodyFunction5() {
    return new TextField(
      //输入字数限制
      maxLength: 5,
      //超出字数限制后仍然可输入
      maxLengthEnforced: false,
      ///激活状态
      enabled: true,
      ///为true时为只读
      readOnly: true,
      //边框样式设置
      decoration: InputDecoration(
        ///只有下边框  配置自定义的边框颜色
        border: UnderlineInputBorder(),
        ///设置输入框可编辑时的边框样式
        ///可理解为enabled为true时，就是当前的输入框为激活状态时
        enabledBorder: OutlineInputBorder(
          ///设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(10)),
          ///用来配置边框的样式
          borderSide: BorderSide(
            ///设置边框的颜色
            color: Colors.blueGrey,
            ///设置边框的粗细
            width: 2.0,
          ),
        ),

        ///输入框不可编辑时显示的边框样式
        ///可理解为enabled为false时，就是当前的输入框为 未激活状态时
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        ///输入框错误提示边框样式
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        ///用来配置输入框获取焦点时的边框样式
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
      ),
    );
  }

}
