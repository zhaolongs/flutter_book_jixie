import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///



//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example235(),
  ));
}


class Example235 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example235> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      //手势识别 用来监听点击背景
      body: Container(
        padding: EdgeInsets.all(20),
        //容器的高度
        height: double.infinity,
        child: Column(
          children: [
            buildBorder(),
            //buildRadial()
          ],
        ),
      ),
    );
  }

  ///代码清单 2-60
  ///lib/code/code2/example_235_container_page.dart
  ///  Container ShapeDecoration 的基本使用
  ///  通过Border来创建边框样式
  Container buildBorder() {
    return Container(
      width: 100,
      height: 100,
      decoration: new ShapeDecoration(
        //填充的颜色
        color: Colors.grey,
        //通过Border来构建边框装饰样式
        shape: Border.all(
            //边框的颜色
            color: Colors.red,
            //取值BorderStyle.solid表示显示边框装饰样式
            //取值BorderStyle.none表示不显示边框装饰样式
            style: BorderStyle.solid,
            //边框的宽度
            width: 4),
      ),
    );
  }
}
