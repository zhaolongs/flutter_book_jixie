import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/app/res/string/strings_en.dart';
import 'package:flutterbookcode/app/res/string/strings_zh.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/22.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
/// lib/app/res/string/strings.dart
//配置自定义语言配置代理  多语言环境文字文件
//定义程序中使用到的文字 多语言适配
class StringLanguages {

  //记录当前应用程序使用到的本地化配制
  final Locale locale;
  ///在M[yLocationsLanguageDelegates]中的load方法中进行初始化
  StringLanguages(this.locale);

  ///通过Localizations的of方法快速获取当前的StringLanguages对象
  static of(BuildContext context){
    return Localizations.of(context, StringLanguages);
  }
  ///根据Key来加载对应语言环境的文字
  String get(String tag){
    return localValue[locale.languageCode][tag];
  }
  //定义多语言环境支持数据
  static Map<String,dynamic> localValue = {
    //英文支持
    'en':EnStrings.map,
    //中文支持
    'zh':ZhStrings.map,
  };

}
