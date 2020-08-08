

///2.9.5  配置自定义语言配置代理 MyLocationsLanguageDelegates的实现
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterbookcode/app/res/string/strings.dart';

///lib/app/config/language_config.dart
///配置自定义语言配置代理 MyLocationsLanguageDelegates的实现
class MyLocationsLanguageDelegates extends LocalizationsDelegate<StringLanguages>{

  ///创建默认构造
  const MyLocationsLanguageDelegates();
  ///创建静态构造
  static MyLocationsLanguageDelegates delegate = new MyLocationsLanguageDelegates();

  @override
  bool isSupported(Locale locale) {
    ///判断是否支持 ['en','zh'] 其中的一个
    return ['en','zh'].contains(locale.languageCode);
  }

  ///通过load方法关联我们自定义的多语言配制文件MyLocationsLanguages的
  @override
  Future<StringLanguages> load(Locale locale) {
    ///异步初始化MyLocationsLanguages
    return SynchronousFuture(StringLanguages(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate old) {
   ///是否需要重载
    return false;
  }
}
