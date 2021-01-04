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

///代码清单 5-6 ScrollController滚动控制器操作工具类
///lib/utils/scrollcontroller_utils.dart

class ScrollControllerUtils{

  ///滚动到顶部
  static void scrollToTop(ScrollController scrollController){
    scrollOffset(0.0,scrollController);
  }

  ///滚动到底部
  static void scrollToBottom(ScrollController scrollController){
    //获取scrollController最大的可滑动距离
    double maxScroll =scrollController.position.maxScrollExtent;
    scrollOffset(maxScroll,scrollController);
  }

  ///滑动到指定的Widget的位置
  static void scrollToWidgetPostion(GlobalKey key,ScrollController scrollController){
    ///根据 key 来获取指定的Widget的位置信息
    BuildContext stackContext = key.currentContext;
    if(stackContext!=null){
      RenderBox renderBox = stackContext.findRenderObject();
      if(renderBox!=null){
        //获取指定的Widget的位置信息
        //相对于全局的位置
        Offset offset = renderBox.localToGlobal(Offset.zero);
        //获取指定的Widget的大小 信息
        Size size =renderBox.paintBounds.size;
        print("获取指定的Widget的位置信息 $offset  获取指定的Widget的大小 $size");
        //滑动到这个Widget的位置
        scrollOffset(offset.dy,scrollController);
      }
    }
  }


  ///滚动到指定的位置
  static void scrollOffset(double offset,ScrollController scrollController){
    // 返回到顶部时执行动画
    scrollController.animateTo(offset,
      // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
      duration: Duration(milliseconds: 200),
      //动画曲线是Curves.ease
      curve: Curves.ease,
    );
  }
}