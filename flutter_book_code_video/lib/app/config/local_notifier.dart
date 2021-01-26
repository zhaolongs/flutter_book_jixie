import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/log_util.dart';
import 'package:flutterbookcode/utils/sp_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
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
///

///lib/app/config/local_notifier.dart
class LocaleNotifier extends ChangeNotifier {
  ///语言环境
  Locale _locale;

  LocaleNotifier(this._locale);

  factory LocaleNotifier.zh() => LocaleNotifier(Locale('zh', 'CH'));

  factory LocaleNotifier.en() => LocaleNotifier(Locale('en', 'US'));

  ///修改语言环境
  void changeLocaleState(LocaleNotifier state) {
    LogUtil.e("修改语言环境 $state");
    if (state == null) {
      return;
    }
    _locale = state.locale;

    ///通知
    notifyListeners();

    ///保存
    SPUtil.save(spUserLocalLanguageKey, state.toString());
  }

//获取语言环境
  Locale get locale => _locale;
}
