import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ho/src/common/sp_key.dart';
import 'package:flutter_app_ho/src/utils/sp_utils.dart';
import 'package:flutter_app_ho/src/utils/log_util.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/21.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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
