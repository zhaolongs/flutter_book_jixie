import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
///

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example501(),
  ));
}

///代码清单 5-1 SingleChildScrollView 的基本使用
///lib/code/code5/example_501_SingleChildScrollView.dart
class Example501 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example501> {
  //滑动控制器
  ScrollController _scrollController = new ScrollController();

  //文本的关键Key
  GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: SingleChildScrollView(
        //设置内边距
        padding: EdgeInsets.all(20),
        //   设置滑动反弹效果  BouncingScrollPhysics
        //   无滑动反弹效果 ClampingScrollPhysics
        //   不可滑动 NeverScrollableScrollPhysics
        physics: BouncingScrollPhysics(),
        //配制滑动控制器
        controller: _scrollController,
        //子Widget 通常是UI布局系列的 Column 、Stack 、Row
        child: Container(
          alignment: Alignment.center,
          color: Colors.grey,
          height: 1600,
          child: Text("测试数据",key: _globalKey,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //scrollToTop();
          scrollToWidgetPostion(_globalKey);
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  ///代码清单 5-2 ScrollController 的监听
  ///lib/code/code5/example_501_SingleChildScrollView.dart
  @override
  void initState() {
    super.initState();
    //添加滚动监听
    _scrollController.addListener(() {
      //滚动时会实时回调这里
      //获取滚动的距离
      double offsetValue = _scrollController.offset;
      //ScrollView最大可滑动的距离
      double max = _scrollController.position.maxScrollExtent;
      if (offsetValue <= 0) {
        //如果有回弹效果 offsetValue 会出现负值
        print("滚动到了顶部");
      } else if (offsetValue >= max) {
        //如果有回弹效果 offsetValue的值是会大于 max
        print("滚动到了底部");
      } else {
        print("滑动的距离 offsetValue $offsetValue  max $max");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // 为了避免内存泄漏，需要调用 dispose
    _scrollController.dispose();
  }

  ///代码清单 5-3 ScrollController 的监听
  ///lib/code/code5/example_501_SingleChildScrollView.dart
  ///滚动到指定的位置
  void scrollOffset(double offset) {
    // 返回到顶指定位置
    _scrollController.animateTo(
      offset,
      // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
      duration: Duration(milliseconds: 200),
      //动画曲线是Curves.ease
      curve: Curves.ease,
    );
  }

  ///代码清单 5-4
  ///lib/code/code5/example_501_SingleChildScrollView.dart
  //滚动到顶部
  void scrollToTop() {
    scrollOffset(0.0);
  }

  //滚动到底部
  void scrollToBottom() {
    //获取scrollController最大的可滑动距离
    double maxScroll = _scrollController.position.maxScrollExtent;
    scrollOffset(maxScroll);
  }

  ///代码清单 5-5 滑动到指定的Widget的位置
  ///lib/code/code5/example_501_SingleChildScrollView.dart
  ///通过Widget绑定的GlobalKey来获取位置信息
  void scrollToWidgetPostion(GlobalKey key) {
    //根据 key 来获取上下文对象 也就是Element信息
    BuildContext stackContext = key.currentContext;
    if (stackContext != null) {
      //获取对应的RenderObj对象
      RenderBox renderBox = stackContext.findRenderObject();
      if (renderBox != null) {
        //获取指定的Widget的位置信息
        //相对于全局的位置
        Offset offset = renderBox.localToGlobal(Offset.zero);
        //获取指定的Widget的大小 信息
        Size size = renderBox.paintBounds.size;
        print("获取指定的Widget的位置信息 $offset  获取指定的Widget的大小 $size");
        //滑动到这个Widget的位置
        scrollOffset(offset.dy);
      }
    }
  }
}
