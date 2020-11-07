import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/

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
