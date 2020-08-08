import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_root.dart';
import 'config/home_notifier.dart';
import 'config/local_notifier.dart';
import 'config/theme_notifier.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/20.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// lib/app/app.dart
/// 应用程序的根目录
/// [MaterialApp]的基本配制
class RootApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RottAppState();
  }
}

class _RottAppState extends State<RootApp> {
  ///Provider的三个好兄弟：
  ///老大 -- MultiProvider  供货商
  ///老二 -- Providers   货源
  ///老三 -- Provider.of<T>(context)  /  Widget Consumer 消费者
  @override
  Widget build(BuildContext context) {
    ///供货商
    return MultiProvider(
      ///构建子Widget
      child: AppRootPage(),
      ///货源
      providers: [
        //在这里可配置多个数据模型的Provider
        //将Provider配制在程序的最顶层
        //随着某些数据改变而被通知更新
        ///provider不需要被监听，有的常量或者方法，根本不需要“牵一发而动全身”，也就是说他们不会被要求随着变动而变动
        /// ChangeNotifierProvider 它会随着某些数据改变而被通知更新
        /// 比如这个Model被用在多个page，那么当其中一处被改变时，他就应该告诉其他的地方，应该更新了
        /// ChangeNotifierProxyProvider  比如一个ModelA依赖另一个ModelB，ModelB更新，他就要让依赖它的ModelA也随之更新
        ChangeNotifierProvider<ThemeNotifier>.value(
          //value就是监听的数据模型对象
          value: ThemeNotifier(),
        ),
        ChangeNotifierProvider<LocaleNotifier>.value(
          //value就是监听的数据模型对象
          value: LocaleNotifier(null),
        ),
        ChangeNotifierProvider<HomeNotifier>.value(
          //value就是监听的数据模型对象
          value: HomeNotifier(),
        ),

      ],
    );
  }
}
