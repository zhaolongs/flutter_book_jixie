
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
    home: Example604(),
  ));
}

/// 代码清单 6-6 缩放动画[AnimatedPadding]
///lib/code/code6/example_604_Opacity.dart
class Example604 extends StatefulWidget {
  @override
  _Example604State createState() => _Example604State();
}

class _Example604State extends State<Example604> {

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
                    _padding = EdgeInsets.all(0);
                  } else {
                    _padding = EdgeInsets.all(200);
                  }
                });
              },
            ),

            buildAnimatedPadding()
          ],
        ),
      ),
    );
  }

 //默认为内边距 子Widget是放大效果
  bool _isOpen = true;

  //当前页面显示组件的内边距
  EdgeInsetsGeometry _padding = EdgeInsets.zero;

 ///构建Padding动画[AnimatedPadding] 形成的是一个中心绽放的动画效果
  Widget buildAnimatedPadding() {
    //固定大小
    return Container(
      width: 200,
      height: 200,
      //在父布局固定大小的基础上修改
      //内边距从而达到缩小与放大的效果
      child: AnimatedPadding(
        //内边距 EdgeInsetsGeometry 类型
        padding: _padding,
        //动画插值器
        curve: Curves.ease,
        //过渡时间
        duration: Duration(seconds: 1),
        //子Widget
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
