import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/14.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code23/main_data2302.dart
class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

//lib/code/main_data.dart
class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("透明度动画"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120.0,
            width: 120.0,
            ///背景
            color: Colors.blue[50],
            child: buildAnimatedOpacity(),
          ),


          RaisedButton(
            child: Text('修改透明度'),
            onPressed: () {
              setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
            },
          ),

        ],
      ),
    );
  }

  ///lib/code23/main_data2302.dart
  ///当前页面显示组件的透明度
  double opacityLevel = 1.0;

  ///构建透明动画组件[AnimatedOpacity]
  AnimatedOpacity buildAnimatedOpacity() {
    return AnimatedOpacity(
      ///透明度
      opacity: opacityLevel,
      ///过渡时间
      duration: Duration(milliseconds: 2000),
      ///动画插值器
      curve: Curves.linear,
      ///动画过渡完毕的回调
      onEnd: () {},
      ///子Widget
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
