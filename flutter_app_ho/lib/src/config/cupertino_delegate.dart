import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423///
/// flutter使用CupertinoAlertDialog，点击弹出按键时报
/// The getter 'alertDialogLabel' was called on null
/// 跳入到上一层dialog.dart中的确有个label: localizations.alertDialogLabel,
/// 但是CupertinoAlertDialog没有该属性 所以会报错
class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {

  ///创建默认构造
  const FallbackCupertinoLocalisationsDelegate();
  ///创建静态构造
  static FallbackCupertinoLocalisationsDelegate delegate = new FallbackCupertinoLocalisationsDelegate();
  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}
