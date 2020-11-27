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

///[GlobalKey]操作工具类
///lib/utils/global_key_utils.dart
class GlobalKeyUtils {
  ///根据[GlobalKey]
  ///获取在全局中的大小信息
  static Size getWidgetSize(GlobalKey globalKey) {
    ///先获取RenderBox
    RenderBox renderBox = getRenderBox(globalKey);
    if (renderBox != null) {
      ///获取指定的Widget的大小 信息
      Size size = renderBox.paintBounds.size;
      return size;
    } else {
      return Size.zero;
    }
  }

  ///根据[GlobalKey]
  ///获取在全局中的位置信息
  static Offset getWidgetOffset(GlobalKey globalKey) {
    ///先获取RenderBox
    RenderBox renderBox = getRenderBox(globalKey);
    if (renderBox != null) {
      ///获取指定的Widget的位置信息
      ///相对于全局的位置
      Offset offset = renderBox.localToGlobal(Offset.zero);
      return offset;
    } else {
      return Offset.zero;
    }
  }

  ///根据[GlobalKey]
  ///获取对应的Widget的[RenderBox]
  static RenderBox getRenderBox(GlobalKey globalKey) {
    ///只有Widget渲染完成时才能拿到 Context 与 RenderBox
    ///根据 key 来获取指定的Widget的位置信息
    BuildContext stackContext = globalKey.currentContext;
    if (stackContext != null) {
      ///在运行程序渲染到页面上，首先是根据Widget生成对应的Element，
      ///然后创建相应的RenderObject并关联到Element.renderObject属性上，
      ///最后再通过RenderObject来完成布局排列和绘制
      ///RenderObject的主要职责是排列和绘制
      ///RenderBox继承自RenderObject，用来保存当前的Widget的大小与位置信息
      RenderBox renderBox = stackContext.findRenderObject();
      return renderBox;
    } else {
      return null;
    }
  }
}
