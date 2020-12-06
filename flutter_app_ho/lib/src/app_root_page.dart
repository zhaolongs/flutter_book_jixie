import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_life_state/flutter_life_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'bean/bean_global.dart';
import 'common/global.dart';
import 'config/cupertino_delegate.dart';
import 'index_page.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
/// lib/app/app_root_page.dart
class AppRootPage extends StatefulWidget {
  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> {
  //默认过滤的颜色
  Color _defaultFilterColor = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: rootStreamController.stream,
      initialData: GlobalBean(100,Colors.transparent),
      builder: (BuildContext context, AsyncSnapshot<GlobalBean> snapshot) {
        //获取数据
        if(snapshot.data.code==100){
          _defaultFilterColor = snapshot.data.data;
        }
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
              //动态生成过滤颜色
              _defaultFilterColor,
              //过滤模式
              BlendMode.color),
          //构建MaterialApp根组件
          child: buildMaterialApp(),
        );
      },
    );
  }

  ///构建 MaterialApp 组件
  ///[value] 参数就是当前更新的主题
  MaterialApp buildMaterialApp() {
    return MaterialApp(
      //应用的主题
      theme: ThemeData(
        // brightness: Brightness.light,
        //主背景色
        primaryColor: Colors.blue,
        //Scaffold脚手架的背景色
        scaffoldBackgroundColor: Color(0xffeeeeee),
      ),
      //应用程序默认显示的页面
      home: IndexPage(),
      //dubug模式下不显示debug标签
      debugShowCheckedModeBanner: false,
      //国际化语言环境
      localizationsDelegates: [
        //初始化默认的 Material 组件本地化
        GlobalMaterialLocalizations.delegate,
        //初始化默认的 通用 Widget 组件本地化
        GlobalWidgetsLocalizations.delegate,
        //支持使用 CupertinoAlertDialog 的代理
        FallbackCupertinoLocalisationsDelegate.delegate,
      ],
      navigatorKey: globalNavigatorKey,
      //路由导航观察者配置
      navigatorObservers: [lifeFouteObserver, routeObserver],
      //配置程序语言环境
      locale: Locale('zh', 'CN'),
    );
  }

  @override
  void dispose() {
    //注销全局流订阅
    rootStreamController.close();
    super.dispose();
  }
}
