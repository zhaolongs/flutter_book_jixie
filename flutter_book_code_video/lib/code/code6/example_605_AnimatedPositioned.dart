
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

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example605(),
  ));
}

/// 代码清单 6-7 [AnimatedPositioned]
///lib/code/code6/example_605_AnimatedPositioned.dart
class Example605 extends StatefulWidget {
  @override
  _Example605State createState() => _Example605State();
}

class _Example605State extends State<Example605> {
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
                    _paddingValue = 0.0;
                  } else {
                    _paddingValue = 30;
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

  //默认为内边距 子Widget是放大效果
  bool _isOpen = true;

  //当前组件的内边距
  double _paddingValue = 0.0;

  //构建容器
  Container buildScalContainer() {
    return Container(
      height: 300,
      child: Stack(
        children: <Widget>[
          //动画方式修改Positioned的内边距限制
          AnimatedPositioned(
            //动画时间
            duration: const Duration(milliseconds: 500),
            //动画插值器
            curve: Curves.fastOutSlowIn,
            //左边距
            left: _paddingValue,
            //顶部边距
            top: _paddingValue,
            //右边距
            right: _paddingValue,
            //底部边距
            bottom: _paddingValue,
            //子Widget
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
