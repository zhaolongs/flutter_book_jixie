import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'example_506_NestScrollView.dart';

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
    theme: ThemeData(primaryColor: Colors.grey[200]),
    home: Example507(),
  ));
}

///代码清单 5-28 下拉放大顶部图片Demo
///lib/code/code5/example_507_NestScrollView.dart
class Example507 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example507>
    with SingleTickerProviderStateMixin {
  //SliverAppBar展开的高度
  double _defaultExpandHeight = 160;

  //初始化要加载到图片上的高度
  double _extraPicHeight = 0;

  //图片填充类型（刚开始滑动时是以宽度填充，拉开之后以高度填充）
  BoxFit _fitType = BoxFit.fitWidth;

  //前一次手指所在处的y值
  double _prePointDy = 0;

  //动画控制器
  AnimationController _ationController;

  //Stream 控制器用来这里的局部刷新功能
  StreamController<double> _streamController = new StreamController();

  //页面初始化方法
  @override
  void initState() {
    super.initState();
    //初始化 回弹执行时间为 400毫秒
    _ationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    //添加一个动画执行过程实时监听
    _ationController.addListener(() {
      //_ationController.value 的值是从 0.0~1.0
      _streamController.add(_extraPicHeight * (1.0 - _ationController.value));
    });

    //添加一个动画执行状态监听
    _ationController.addStatusListener((status) {
      //获取动画状态
      AnimationStatus animationStatus = _ationController.status;
      //动画执行完成
      if (animationStatus == AnimationStatus.completed) {
        //更新图片展开添加的高度为0
        _extraPicHeight = 0;
        //修改图片的填充方式
        _fitType = BoxFit.fitWidth;
      }
    });
  }

  //页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();
    //关闭通道
    _streamController.close();
    //释放动画控制器
    _ationController.dispose();
  }

  ///代码清单 5-29 下拉放大顶部图片Demo build函数
  ///lib/code/code5/example_507_NestScrollView.dart
  @override
  Widget build(BuildContext context) {
    //手势监听
    return Listener(
      child: Scaffold(
        body: NestedScrollView(
          physics: BouncingScrollPhysics(),
          //配置可折叠的头布局
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [buildStreamBuilder()];
          },
          //页面的主体内容
          body: ItemPage(1),
        ),
      ),
      onPointerMove: (result) {
        //手指的移动时
        updatePicHeight(result.position.dy); //自定义方法，图片的放大由它完成。
      },
      onPointerUp: (result) {
        //当手指抬起离开屏幕时
        resetSetPicHeight();
      },
    );
  }

  ///代码清单 5-30 下拉放大顶部图片Demo build函数
  ///lib/code/code5/example_507_NestScrollView.dart
  StreamBuilder<double> buildStreamBuilder() {
    return StreamBuilder<double>(
      //绑定流
      stream: _streamController.stream,
      //初始化的数据 这里用作图片放大的高度
      initialData: 0.0,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        //构建需要更新的 Widget
        return buildSliverAppBar(snapshot.data);
      },
    );
  }

  ///代码清单 5-31 下拉放大顶部图片Demo SliverAppBar 的创建
  ///lib/code/code5/example_507_NestScrollView.dart
  Widget buildSliverAppBar(double extraHeight) {
    return SliverAppBar(
      title: Text("详情"),
      //标题居中
      centerTitle: true,
      //5.1.2小节中有对这一块的属性配置说明
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0.0,
      //展开的高度
      expandedHeight: _defaultExpandHeight + extraHeight,
      //第二部分 AppBar下的内容区域
      flexibleSpace: FlexibleSpaceBar(
        //背景
        //配置的是一个widget也就是说在这里可以使用任意的
        //Widget组合 在这里直接使用的是一个图片
        background: Column(
          children: [
            Container(
              //缩放的图片
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/2.0x/banner3.webp",
                  height: 180 + extraHeight, fit: _fitType),
            )
          ],
        ),
      ),
    );
  }

  ///代码清单 5-32
  ///lib/code/code5/example_507_NestScrollView.dart
  updatePicHeight(changed) {
    print("extraPicHeight $_extraPicHeight prev_dy $_prePointDy");
    //安全判断  qwer 77890
    if (_prePointDy == 0.0) {
      _prePointDy = changed;
    }
    //向下滑动时 会大于0
    if (_extraPicHeight >= 0) {
      //改变图片的填充方式，让它由以宽度填充变为以高度填充，从而实现了图片视角上的放大。
      _fitType = BoxFit.fitHeight;
    } else {
      //向上滑动时折叠隐藏
      _fitType = BoxFit.fitWidth;
    }
    //每次滑动的距离 加载到图片上的高度。
    _extraPicHeight += changed - _prePointDy;
    //更新手指位点坐标
    _prePointDy = changed;
    //只有向下滑动时图片放大的情况再更新放大的效果
    if (_extraPicHeight >= 0) {
      //更新图片的高度
      _streamController.add(_extraPicHeight);
    } else {
      //如果是向上折叠的过程不记录手指点位
      _prePointDy = 0.0;
    }
  }

  ///代码清单 5-33
  ///lib/code/code5/example_507_NestScrollView.dart
  resetSetPicHeight() {
    if (_prePointDy >= 0) {
      _prePointDy = 0;
      //设置动画让extraPicHeight的值从当前的值渐渐回到 0
      _ationController.reset();
      _ationController.forward();
    }
  }
}
