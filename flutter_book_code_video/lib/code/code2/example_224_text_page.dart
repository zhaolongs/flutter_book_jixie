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
    home: Example224(),
  ));
}

class Example224 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example224> {
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
          buildAnimatedDefaultTextStyle(),
          OutlineButton(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: Text("切换样式"),
          )
        ]),
      ),
    );
  }

  ///代码清单 2-42
  ///lib/code/code2/example_224_text_page.dart
  bool isSelected = false;

  //构建动画样式组件
  Widget buildAnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      //设置Text中的文本样式
      //每当样式有改变时会以动画的方式过渡切换
      style: isSelected
          ? TextStyle(
              fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold)
          : TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w100),
      //动画切换的时间
      duration: const Duration(milliseconds: 200),
      //动画执行插值器
      curve: Curves.bounceInOut,
      //文本对齐方式
      textAlign: TextAlign.start,
      //文本是否应该在软换行符处换行
      softWrap: true,
      //超过文本行数区域的裁剪方式
      //设置设置为省略号
      overflow: TextOverflow.ellipsis,
      //最大显示行数
      maxLines: 1,
      //每当样式有修改触发动画时
      //动画执行结束的回调
      onEnd: () {
        print("动画执行结束");
      },

      //文本组件
      child: Text("Hello, Flutter"),
    );
  }
}
