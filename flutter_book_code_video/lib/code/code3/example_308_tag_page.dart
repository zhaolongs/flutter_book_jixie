import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tag_layout/flutter_tag_layout.dart';

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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example308(),
  ));
}

///代码清单 3-18 TextLayoutMainPage 的基本使用
///计算自适应换行功能
///lib/code/code3/example_308_tag_page.dart
class Example308 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example308> {
  // Wrap 流式布局 文本标签 模拟数据
  List<String> testTextList = [
    "测试",
    "这是什么",
    "晨",
    "来一下",
    "测试了",
    "你好吗",
    "码字",
    "勇敢的心",
    "我来了",
    "天气真好"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Container(
        //文字标签流式布局
        child: TextLayoutMainPage(
          //文字标签集合
          buildTextLayoutData(),
          //可选参数 文字内边距
          padding: EdgeInsets.all(2),
          //可选参数 文字外边距
          margins: EdgeInsets.only(left: 6, right: 4, top: 2, bottom: 2),
        ),
      ),
    );
  }

  //构建流式布局文字标签使用的数据模型
  List<TextLayoutModel> buildTextLayoutData() {
    List<TextLayoutModel> textLayoutModel4List = [];
    for (int i = 0; i < testTextList.length; i++) {
      TextLayoutModel model = TextLayoutModel(
          //文字内容
          "${testTextList[i]}",
          //文字大小
          textSize: 12,
          //背景颜色
          textBackgroundColor: Colors.blue,
          //无背景
          backgroundModel: TextLayoutBackgroundModel.ovalBorder,
          //文字颜色随机
          isTextColorRandom: true,
          //无文字前Icon
          icon: null,
          //显示文字前小圆点
          isShowCirPoint: true);

      textLayoutModel4List.add(model);
    }

    return textLayoutModel4List;
  }
}
