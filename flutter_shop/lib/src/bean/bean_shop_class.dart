import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/8.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-53
///分类选择页面 使用数据模型
///lib/src/bean/bean_shop_class.dart
class ShopClassBean {
  //是否选中
  bool isSelect;
  //标题
  String classTitle;
  //唯一标识
  int classId;

  ShopClassBean({this.isSelect = false, this.classTitle, this.classId});
}

//右侧分类一级数据模型
class RightListBean{
  String title;
  List<RightClassBean> classList;
}
//右侧分类二级数据模型
class RightClassBean {
  String classTitle;
  String imagePath;
  int classId;

  RightClassBean({this.imagePath, this.classTitle, this.classId});
}
