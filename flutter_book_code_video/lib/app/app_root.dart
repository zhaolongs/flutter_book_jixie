import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/log_util.dart';

import 'config/cupertino_delegate.dart';
import 'config/language_config.dart';
import 'config/local_notifier.dart';
import 'config/observer_route.dart';
import 'config/theme_notifier.dart';import 'package:provider/provider.dart';

import 'index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// lib/app/app_root.dart
class AppRootPage extends StatefulWidget {
  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> {
  ///用户的国际化配置
  Locale _userLocale;
  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeNotifier, LocaleNotifier>(
      builder: consumerBuilder,
    );
  }
  /// lib/app/app_root.dart
  ///Consumer2的构建builder功能
  ///[context] 参数一 回调的上下文对象
  ///[value] 参数二 对应 [Consumer2]中的泛型[ThemeNotifier]类型
  ///[localeState] 参数三 对应 [Consumer2]中的泛型[LocaleNotifier]类型
  Widget consumerBuilder(
      BuildContext context, ThemeNotifier value,
      LocaleNotifier localeState, Widget child) {

    ///记录国际化配制
    _userLocale = localeState.locale;
    LogUtil.e("根目录 修改语言环境 $_userLocale");
    ///通过 ColorFiltered 组件将应用内的内容一键变
    ///为灰色
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          ///动态生成过滤颜色
          selectColorFilterValue(value),
          ///过滤模式
          BlendMode.color),
      ///构建MaterialApp根组件
      child: buildMaterialApp(value),
    );
  }

  ///如果当前主题是灰色主题
  ///就启动ColorFiltered的过滤效果
  Color selectColorFilterValue(ThemeNotifier value) {
    return value.currentThemeData.primaryColor == Colors.grey
        ? Colors.grey
        : Colors.transparent;
  }

  /// lib/app/app_root.dart
  ///构建 MaterialApp 组件
  ///[value] 参数就是当前更新的主题
  MaterialApp buildMaterialApp(ThemeNotifier value) {
    return MaterialApp(
      ///应用的主题
      theme: value.currentThemeData,
      ///应用程序默认显示的页面
      home: IndexPage(),
      debugShowCheckedModeBanner: false,
      ///国际化语言环境
      localizationsDelegates: [
        ///初始化默认的 Material 组件本地化
        GlobalMaterialLocalizations.delegate,
        ///初始化默认的 通用 Widget 组件本地化
        GlobalWidgetsLocalizations.delegate,
        ///自定义的语言配制文件代理 初始化
        MyLocationsLanguageDelegates.delegate,
        ///支持使用 CupertinoAlertDialog 的代理
        FallbackCupertinoLocalisationsDelegate.delegate,
      ],
      ///路由导航观察者配置
      navigatorObservers: [routeObserver],
      ///用来监听当前设备语言设置的变化。
      ///在APP第一次启动的时候会被调用
      localeResolutionCallback: localeCallback,
      ///配置程序语言环境
      locale: _userLocale,
      ///定义当前应用程序所支持的语言环境
      supportedLocales: [
        const Locale('en', 'US'), // English 英文
        const Locale('zh', 'CN'), // 中文，
      ],
    );
  }

  /// lib/app/app_root.dart
  ///[sysLocale]参数 反回当前系统的语言环境
  ///[supportedLocales] 返回 supportedLocales 中配制的语言环境支持的配置
  Locale localeCallback(Locale sysLocale, Iterable<Locale> supportedLocales) {

    ///判断应用程序是否支持当前系统语言
    List<String> locals = [];
    ///转List集合
    List<Locale> list = supportedLocales.toList();
    for (int i = 0; i < list.length; i++) {
      locals.add(list[i].languageCode);
    }

    ///如果当前系统的语言应用程序不支持
    ///那么在这里默认返回英文环境
    if (!locals.contains(sysLocale.languageCode)) {
      sysLocale = Locale('en', 'US');
    }

    if (_userLocale == null) {
      _userLocale = sysLocale;
    }
//    _userLocale = Locale('en', 'US');
    return _userLocale;
  }
}