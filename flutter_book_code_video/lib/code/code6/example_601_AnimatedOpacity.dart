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
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example601(),
  ));
}

/// 代码清单 6-1
///lib/code/code6/example_601_AnimatedOpacity.dart
class Example601 extends StatefulWidget {
  @override
  _Example601State createState() => _Example601State();
}

class _Example601State extends State<Example601> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("基本动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //点击一个按钮
            ElevatedButton(
              child: Text("修改透明度"),
              onPressed: () {
                setState(() {
                  _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
            ),

            buildAnimatedOpacity(),
          ],
        ),
      ),
    );
  }

  //当前页面显示组件的透明度
  double _opacityLevel = 1.0;

  //构建透明动画组件[AnimatedOpacity]
  AnimatedOpacity buildAnimatedOpacity() {
    return AnimatedOpacity(
      //透明度
      opacity: _opacityLevel,
      //过渡时间
      duration: Duration(milliseconds: 2000),
      //动画插值器
      curve: Curves.linear,
      //动画过渡完毕的回调
      onEnd: () {},
      //子Widget
      child: Container(
        height: 100,width: 100,
        color: Colors.red,
      ),
    );
  }
}
