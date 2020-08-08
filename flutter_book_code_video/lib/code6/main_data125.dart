import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code18/main_data125.dart
///AnimatedContainer 的基本使用
class AnimatedContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClipRectPageState();
  }
}

class ClipRectPageState extends State {
  ///点击标识
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("AnimatedContainer基本使用"),
      ),
      body: Center(
        ///手势识别
        child: GestureDetector(
          onTap: () {
            setState(() {
              click = !click;
            });
          },
          ///动画容器
          child: AnimatedContainer(
            ///动画插值器
            curve: Curves.bounceInOut,
            ///容器的高度
            height: click ? 300 : 100,
            ///容器的宽度
            width: click ? 300 : 100,
            ///容器的装饰
            decoration: BoxDecoration(
              ///背景图片
                image: DecorationImage(
                  ///加载资源目录下的图片
                  image: AssetImage('assets/images/2.0x/banner4.webp'),
                  fit: BoxFit.cover,
                ),
                ///圆角
                borderRadius: BorderRadius.all(Radius.circular(
                  click ? 200 : 0,
                ))),
            ///过渡时间
            duration: Duration(milliseconds: 1000),
          ),
        ),
      ),
    );
  }
}
