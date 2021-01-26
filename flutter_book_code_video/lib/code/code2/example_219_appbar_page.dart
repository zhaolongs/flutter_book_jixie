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
    home: Example219(),
  ));
}

///代码清单 2-37  AppBar 结合 PreferredSize
///lib/code/code2/example_219_appbar_page.dart
class Example219 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example219> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //标题
      appBar: AppBar(
        title: Text("AppBar"),
        bottom: buildAppBarTitle(),
        //标题居中
        centerTitle: true,
      ),
      //页面的主内容区
      body: Center(
        child: Text("这里是body"),
      ),
    );
  }

  //构建TabBar
  PreferredSize buildAppBarTitle() {
    //PreferredSize
    return PreferredSize(
      //bottom的高度设置
      preferredSize: Size.fromHeight(44),
      //bottom的子widget
      child: Container(
        color: Colors.white,
        height: 44,
        child: Row(
          //子布局居中
          mainAxisAlignment: MainAxisAlignment.center,
          //两个子木筏，
          children: [
            Text("测试标签1"),
            //SizedBox 这里可理解为是用来填充空间的
            SizedBox(
              width: 20,
            ),
            Text("测试标签2"),
          ],
        ),
      ),
    );
  }
}
