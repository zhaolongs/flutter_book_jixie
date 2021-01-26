
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
