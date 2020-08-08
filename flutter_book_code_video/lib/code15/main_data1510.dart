import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbookcode/utils/global_key_utils.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1510.dart
///滚动控制器
class NestScrollBaseUsePage5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {
  ///用来监听滚动距离
  ScrollController scrollController = new ScrollController();

  ///当前的滚动距离
  double scrollOffset = 0.0;

  ///滚动到顶部的标识
  bool isTop = true;

  ///滚动到中部的标识
  bool isMiddle = false;

  ///滚动到底部的标识
  bool isBottom = false;

  ///页面初始化方法
  @override
  void initState() {
    super.initState();

    ///ScrollController添加滚动监听
    scrollController.addListener(() {
      ///滚动信息数组
      List<ScrollPosition> positionList =  scrollController.positions;
      ///获取滚动距离
      double offset = scrollController.offset;

      ///包含滚动信息的信息体
      ScrollPosition scrollPosition = scrollController.position;


      ///滚动到了顶部
      if (offset == scrollPosition.minScrollExtent) {
        isTop = true;
        isBottom = false;
        isMiddle = false;
      } else if (offset == scrollPosition.maxScrollExtent) {
        ///滚动到了底部
        isTop = false;
        isBottom = true;
        isMiddle = false;
      } else {
        ///滚动到中部
        isTop = false;
        isBottom = false;
        isMiddle = true;
      }
      setState(() {
        scrollOffset = offset;
      });
    });
  }

  ///页面销毁回调生命周期
  @override
  void dispose() {
    super.dispose();

    ///释放资源
    scrollController.dispose();
  }

  ///lib/code15/main_data1510.dart
  ///页面构建方法
  @override
  Widget build(BuildContext context) {

    ///构建页面的主体
    return Scaffold(
      appBar: AppBar(title: Text("滑动控制器"),),
      body: Stack(
        children: [
          Positioned(
            left: 0,right: 0,bottom: 0,top: 0,
            child: SingleChildScrollView(
              ///配置控制器
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Container(
                height: 5000,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.black,
              child: Text("当前的滚动距离 $scrollOffset",style: TextStyle(color: Colors.white),),
            ),
            top: 12,
            left: 12,
          ),
        ],
      ),
      floatingActionButton: buildFloatingActionButton(),);
  }

  ///lib/code15/main_data1510.dart
  ///构建动态修改样式的按钮
  Widget buildFloatingActionButton(){
    ///按钮上显示的图标内容
    IconData icon = Icons.arrow_downward;
    if (isTop) {
      ///滚动到顶部里 显示向下的箭头
      icon = Icons.arrow_downward;
    } else if (isBottom) {
      ///滚动到底部时 显示向上的箭头
      icon = Icons.arrow_upward;
    } else {
      icon = Icons.crop_free;
    }
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: () {
        if(isTop){
          ///一键滚动到页面底部
          ///直接显示出底部内容 无动画滚动过渡效果
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        }else if(isBottom){
          ///一键滚动到页面顶部
          ///动画效果滚动
          scrollController.animateTo(scrollController.position.maxScrollExtent,
            // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
            duration: Duration(milliseconds: 200),
            ///动画曲线是Curves.ease
            curve: Curves.ease,);
        }else{
          ///向下滚动一点点
          scrollController.animateTo(scrollController.offset+100,
            // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
            duration: Duration(milliseconds: 200),
            ///动画曲线是Curves.ease
            curve: Curves.ease,);
        }
      },
    );
  }
  ///lib/code15/main_data1510.dart
  ///滑动到页面顶部
  ///无动画效果
  void jumpToTop(){
    scrollController.jumpTo(scrollController.position.minScrollExtent);
  }
  ///滑动到页面顶部
  ///动画效果
  void animateTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
      duration: Duration(milliseconds: 200),
      ///动画曲线是Curves.ease
      curve: Curves.ease,
    );
  }
  ///lib/code15/main_data1510.dart
  ///滑动到页面底部部
  ///动画效果
  void animateBottom() {
    scrollController.animateTo(
      ///获取滑动视图的最大可滑动距离
      scrollController.position.maxScrollExtent,
      //动画时间是200毫秒，
      duration: Duration(milliseconds: 200),
      ///动画曲线是Curves.ease
      curve: Curves.ease,
    );
  }

  ///lib/code15/main_data1510.dart
  ///滑动到 指定位置
  ///动画效果
  void animateToByGlobalKey(GlobalKey globalKey, {Axis scrollDirection = Axis.vertical}) {
    ///根据Widget的主键GlobalKey来获取位置信息
    Offset offset = GlobalKeyUtils.getWidgetOffset(globalKey);
    if (offset != null) {
      scrollController.animateTo(
        ///指定位置
        scrollDirection == Axis.vertical?offset.dx :offset.dy,
        //动画时间是200毫秒，
        duration: Duration(milliseconds: 200),

        ///动画曲线是Curves.ease
        curve: Curves.ease,
      );
    }
  }
}
