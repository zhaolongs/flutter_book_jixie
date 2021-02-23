import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
    home: Example225(),
  ));
}

class Example225 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example225> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("Text文本样式"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(children: [
          buildRichText(),
        ]),
      ),
    );
  }

  ///代码清单 2-24 RichText的基本使用 运行效果如图2-33所示。
  ///lib/code/code2/example_225_text_page.dart
  Widget buildRichText() {
    return RichText(
      //文字区域
      text: TextSpan(
          text: "登录即代表同意",
          style: TextStyle(color: Colors.grey),
          children: [
            TextSpan(
                text: "《用户注册协议》",
                style: TextStyle(color: Colors.blue),
                //点击事件
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("点击用户协议");
                  }),
            TextSpan(
              text: "与",
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
                text: "《隐私协议》",
                style: TextStyle(color: Colors.blue),
                //点击事件
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("点击隐私协议");
                  })
          ]),
    );
  }
}
