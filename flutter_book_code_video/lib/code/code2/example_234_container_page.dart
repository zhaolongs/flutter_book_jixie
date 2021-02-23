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
    home: Example234(),
  ));
}

class Example234 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example234> {
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
            buildRadial(),
            //buildRadial()
          ],
        ),
      ),
    );
  }

  ///代码清单 2-33 Container 圆角边框
  ///lib/code/code2/example_234_container_page.dart
  ///  Container BoxDecoration配置边框与填充色样式
  Container buildBorderAndColor() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        // 边框颜色与宽度
        border: new Border.all(color: Color(0xFFFF0000), width: 0.5),
        //边框圆角 四个角全部配置
        borderRadius: new BorderRadius.all(
          Radius.circular(20),
        ),
        //填充色
        color: Color(0xFF9E9E9E),
      ),
      child: Text("配置边框与填充色"),
    );
  }
  ///代码清单 2-34 Container 阴影 boxShadow 基本使用
  ///lib/code/code2/example_234_container_page.dart
  ///  Container BoxDecoration boxShadow 阴影
  Container buildBoxShadow() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.blue,
        //可配置多组阴影效果
        boxShadow: [
          //配制阴影
          BoxShadow(
            //阴影的颜色
            color: Colors.red,
            //阴影在x轴与y轴上的偏移量
            offset: Offset(10.0, 10.0),
            //模糊半径
            blurRadius: 20.0,
            //阴影的延伸量
            spreadRadius: 1,
          )
        ],
      ),
      child: Text("配置阴影"),
    );
  }

  ///代码清单 2-35 Container  线性渐变颜色过渡
  ///lib/code/code2/example_234_container_page.dart
  ///  Container  gradient 线性渐变颜色过渡
  Container buildBorder5() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
          color: Colors.blue,
          // 线性渐变
          gradient: LinearGradient(
            //渐变过渡的颜色体系
            colors: [Colors.blue, Colors.yellow, Colors.red],
            //过渡的开始位置
            begin: FractionalOffset(0, 0.5),
            //过渡的结束位置
            end: FractionalOffset(1, 0.5),
          )),
      child: Text("配置渐变颜色"),
    );
  }

  ///代码清单 2-36 Container SweepGradient扫描渐变
  ///lib/code/code2/example_234_container_page.dart
  ///   Sweep 扫描渐变颜色过渡
  Container buildSweep() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 100,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 扫描渐变
        gradient: SweepGradient(
          //渐变过渡的颜色体系
          colors: [Colors.blue, Colors.yellow, Colors.red],
          //过渡的开始角度 默认是0
          startAngle: 0.0,
          //过渡的结束角度 默认是1*3.1415926，也就是在默认情况下，是从0-360
          endAngle: 1 * 3.14,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }

  ///代码清单 2-37 RadialGradient 环形渐变过度
  ///lib/code/code2/example_234_container_page.dart
  /// Container BoxDecoration  Radial 环形渐变颜色过渡
  Container buildRadial() {
    return Container(
      //子Widget居中对齐
      alignment: Alignment.center,
      width: 200,
      height: 200,
      decoration: new BoxDecoration(
        color: Colors.blue,
        // 环形渐变
        gradient: RadialGradient(
          //渐变过渡的颜色体系
          colors: [
            Colors.red,
            Colors.yellow,
            Colors.black,
          ],
          //渐变颜色的过渡半径
          //由Container的短边决定
          radius: 0.5,
          //过渡半径之外的颜色填充模式
          // 默认是clamp，直接使用colors中配置的最后一个颜色填充
          //如这里配置的黑色
          tileMode: TileMode.clamp,
          //中心点 默认就是当前Container的中心
          //也可以通过Alignment.center来配置
          center: FractionalOffset(0.5, 0.5),
        ),
      ),
      child: Text("配置渐变颜色"),
    );
  }
}
