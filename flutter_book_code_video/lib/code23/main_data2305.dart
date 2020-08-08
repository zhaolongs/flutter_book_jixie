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

///lib/code23/main_data2304.dart
/// 通过动态的修改Opacity而达到透明度渐变的动画效果
class AnimatedOpacityFromARGBPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityFromARGBPage> {
  ///当前的透明度
  int opacityLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("透明度动画"),
      ),

      ///线性布局将透明组件与滑块上下排列
      body: Column(
        ///子组件顶部对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建透明组件
          buildOpacityContainer(),

          ///构建滑块
          buildContainer()
        ],
      ),
    );
  }

  ///lib/code23/main_data2304.dart
  ///构建滑块
  Container buildContainer() {
    return Container(
      ///线性布局将滑块与显示文字左右排列
      child: Row(
        children: [
          ///填充布局 权重适配
          Expanded(
            child: Container(
              ///滑块
              child: Slider(
                ///滑块的最小值
                min: 0.0,

                ///滑块的最大值
                max: 255.0,

                ///当前滑动的值
                value: opacityLevel.toDouble(),

                ///当滑动时的回调
                onChanged: (value) {
                  setState(() {
                    opacityLevel = value.toInt();
                  });
                },
              ),
            ),
          ),

          ///显示透明度的文本
          Padding(

              ///设置一个右边距
              padding: EdgeInsets.only(right: 16),

              ///opacityLevel.toStringAsFixed(2)方法用来保留两位小数
              child: Text("当前的透明度${opacityLevel.toStringAsFixed(2)}")),
        ],
      ),
    );
  }

  ///lib/code23/main_data2304.dart
  ///构建 容器 Container
  Widget buildOpacityContainer() {
    return Container(
      height: 220.0,
      width: 220.0,

      ///通过动态修改透明颜色通道来实现透明度渐变效果的过渡
      color: Color.fromARGB(

          ///透明颜色通道
          ///取值范围 [0,255]
          opacityLevel,
          222,
          222,
          222),
    );
  }
}
