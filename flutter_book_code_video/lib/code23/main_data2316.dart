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

///lib/code23/main_data2316.dart
class SlideTransitionPage extends StatefulWidget {
  @override
  _TransformPageState createState() => _TransformPageState();
}

///lib/code23/main_data2316.dart
class _TransformPageState extends State<SlideTransitionPage>
    with SingleTickerProviderStateMixin {
  ///动画控制器
  AnimationController _animationController;
  Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();

    ///创建控制器
    _animationController = new AnimationController(
        ///最小值
        lowerBound: 0,
        ///最大值
        upperBound:  1.0,
        ///正向执行的时间
        duration: Duration(milliseconds: 1000),
        ///反向执行的时间
        reverseDuration: Duration(milliseconds: 1800),
        ///绑定Ticker
        vsync: this);
    //begin: Offset.zero, end: Offset(1, 0)
    //    以左上角为参考点，相对于左上角坐标 x轴方向向右 平
    //    移执行动画的view 的1倍 宽度，y轴方向不动，也就是水平向右平移
    //end: Offset.zero, end: Offset(1, 1)
    //    以左上角为参考点，相对于左上角坐标 x轴方向向右
    //    平移执行动画的view 的1倍 宽度，y轴方向 向下 平衡执行动画view 的1倍的高度，
    //    也就是向右下角平移
   ///通过 animate 方法将Animation与动画控制器AnimationController结合在一起
    _animation = Tween(begin: Offset.zero, end: Offset(1, 0))
        .animate(_animationController);

    _animationController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    ///销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("旋转动画"),
      ),

      ///线性布局将缩放组件与滑块上下排列
      body: Column(
        ///子组件顶部对齐
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ///构建缩放组件
          buildScalContainer(),

          ///构建滑块
          buildContainer(),

          ///
          buildButton(),
        ],
      ),
    );
  }

  ///lib/code23/main_data2316.dart
  ///构建滑块
  Container buildContainer() {
    return Container(
      ///线性布局将滑块与显示文字左右排列
      child: Row(
        children: [
          ///显示缩放度的文本
          Padding(
              ///设置一个右边距
              padding: EdgeInsets.only(right: 16),
              ///opacityLevel.toStringAsFixed(2)方法用来保留两位小数
              child: Text("当前的旋转弧度 ${_animationController.value.toStringAsFixed(2)}")),
        ],
      ),
    );
  }

  ///lib/code23/main_data2316.dart
  ///构建平移变换
  Widget buildScalContainer() {
    return SlideTransition(
      ///设置平移
      position: _animation,
      ///执行缩放变换的子Widget
      child: Container(
        height: 100,width: 300,
        color: Colors.blue,
      ),
    );
  }

  buildButton() {
    return RaisedButton(
      child: Text("开启动画"),
      onPressed: () {
        if (_animationController.isCompleted) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      },
    );
  }
}
