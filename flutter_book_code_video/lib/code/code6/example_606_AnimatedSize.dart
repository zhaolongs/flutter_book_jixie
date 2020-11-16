import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18606543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example606(),
  ));
}

/// 代码清单 6-8 [AnimatedSize]
///lib/code/code6/example_606_AnimatedSize.dart
class Example606 extends StatefulWidget {
  @override
  _Example606State createState() => _Example606State();
}

class _Example606State extends State<Example606>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("基本动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //点击一个按钮
            ElevatedButton(
              child: Text("执行 "),
              onPressed: () {
                setState(() {
                  _isOpen = !_isOpen;
                  if (_isOpen) {
                    _width = 200;
                    _height = 200;
                  } else {
                    _width = 100;
                    _height = 100;
                  }
                });
              },
            ),
            buildScalContainer()
          ],
        ),
      ),
    );
  }


  bool _isOpen = true;

  //当前组件宽高
  double _width = 160;
  double _height = 160;

//构建容器
  Widget buildScalContainer() {
    return AnimatedSize(
      //绑定Ticker
      vsync: this,
      //动画时间
      duration: const Duration(milliseconds: 1500),
      reverseDuration: Duration(milliseconds: 1500),
      //动画插值器
      curve: Curves.fastOutSlowIn,
      //子Widget
      child: Container(
        width: _width,
        height: _height,
        color: Colors.blue,
      ),
    );
  }
}
