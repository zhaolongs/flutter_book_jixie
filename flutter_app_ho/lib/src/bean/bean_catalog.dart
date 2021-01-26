import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
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
