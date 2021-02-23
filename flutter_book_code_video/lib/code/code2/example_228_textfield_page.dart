import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///
///


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example228(),
  ));
}

class Example228 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example228> {
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
          buildTextField3(),
        ]),
      ),
    );
  }


  ///
  ///设置无边框
  Widget buildTextField() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        //设置无边框
        border: InputBorder.none,
      ),
    );
  }

  ///代码清单 2-47
  ///lib/code/code2/example_228_textfield_page.dart
  /// 设置上下左右 都有边框
  Widget buildTextField2() {
    return new TextField(
      //边框样式设置
      decoration: InputDecoration(
        //设置上下左右 都有边框
        //设置四个角的弧度
        border: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
      ),
    );
  }

  ///代码清单 2-27 文本输入框 InputDecoration 各种状态下的边框样式
  ///lib/code/code2/example_228_textfield_page.dart
  // 只有下边框  配置自定义的边框颜色
  Widget buildTextField3() {
    return new TextField(
      //输入字数限制
      maxLength: 5,
      //超出字数限制后仍然可输入
      maxLengthEnforced: false,
      //激活状态
      enabled: true,
      //为true时为只读
      readOnly: false,
      //边框样式设置
      decoration: InputDecoration(
        //只有下边框  配置自定义的边框颜色
        border: UnderlineInputBorder(),
        //设置输入框可编辑时的边框样式
        //可理解为enabled为true时，就是当前的输入框为激活状态时
        enabledBorder: OutlineInputBorder(
          //设置边框四个角的弧度
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //用来配置边框的样式
          borderSide: BorderSide(
            //设置边框的颜色
            color: Colors.blueGrey,
            //设置边框的粗细
            width: 2.0,
          ),
        ),

        //输入框不可编辑时显示的边框样式
        //可理解为enabled为false时，就是当前的输入框为 未激活状态时
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        //输入框错误提示边框样式
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        //用来配置输入框获取焦点时的边框样式
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
