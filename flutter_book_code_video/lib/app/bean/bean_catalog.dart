import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/app/bean/bean_catalog.dart
class CatalogBean {
  ///目录标题
  String pageTitle;
  ///章节简介信息
  String pageMessage;
  ///目录对应的详情页面
  Widget page;
  CatalogBean(this.pageTitle, this.page, this.pageMessage);
}
