//2.6.3 /lib/utils/code1/navigator_utils.dart
//NavigatorObservers实战 工具类封装
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/route/circle/circle_path.dart';

class NavigatorUtils {
  //关闭当前页面
  //[context]当前页面的Context
  //[parameters]回传上一个页面的参数
  static pop(BuildContext context, {parameters}) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop(parameters);
    } else {
      //最后一个页面不可pop
    }
  }

  //[context]当前页面的Context
  //[routeName]目标页面的路由名称
  //[paramtes]向目标页面传的参数
  //[callback]目标页面关闭时的回调函数
  static pushName(BuildContext context, String routeName,
      {paramtes, Function callback}) {
    Navigator.of(context)
        .pushNamed(routeName, arguments: paramtes)
        .then((value) {
      if (callback != null) {
        callback(value);
      }
    });
  }

  //动态路由方法封装
  //[context]当前页面的Context
  //[routeName]目标页面的路由名称
  //[paramtes]向目标页面传的参数
  //[callback]目标页面关闭时的回调函数
  static pushPage(BuildContext context, Widget page,
      {String routeName, paramtes, Function callback}) {
    PageRoute pageRoute;
    //是导入io包
    if (Platform.isIOS) {
      //iOS平台使用支持滑动关闭页面的路由控制
      pageRoute = new CupertinoPageRoute(
        builder: (_) {
          return page;
        },
        settings: RouteSettings(name: routeName, arguments: paramtes),
      );
    } else {
      //Android等其他平台使用Material风格的路由控制
      pageRoute = new MaterialPageRoute(
        builder: (_) {
          return page;
        },
        settings: RouteSettings(name: routeName, arguments: paramtes),
      );
    }
    //压栈
    Navigator.of(context).push(pageRoute).then((value) {
      //目标页面关闭时回调函数与回传参数
      if (callback != null) {
        callback(value);
      }
    });
  }

  ///lib/utils/code1/navigator_utils.dart
  ///以透明过渡的方式打开新的页面
  ///[opaque] 是否以背景透明的方式打开新的页面
  ///[isReplace] 是否替换当前路由中的页面
  static void openPageByFade(BuildContext context, Widget page,
      {bool isReplace = false,
        bool opaque = true,
        Function(dynamic value) dismissCallBack}) {
    PageRouteBuilder pageRouteBuilder = new PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面
          return page;
        },
        transitionDuration: Duration(milliseconds: 800),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,) {
          //渐变过渡动画
          return FadeTransition(
            // 透明度从 0.0-1.0
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                //动画曲线规则，这里使用的是先快后慢
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
        });
    if (isReplace) {
      Navigator.of(context).pushReplacement(pageRouteBuilder);
    } else {
      Navigator.of(context).push(pageRouteBuilder).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

  //lib/code1/main_data9.dart
  ///圆形过渡的方式打开新的页面"
  ///
  /// [page]将要打开的页面
  ///[key]点击事件触发的Widget所绑定的Key,例如Button
  ///[centerOffset] 过渡的圆形位置
  ///[key]绑定事件的Widget的GlobalKey，也就是根据key来计算[centerOffset]，
  ///如果配置同时配置了[key]与[centerOffset]，那么会优先使用[key]来计算中心位置
  ///[routeName]目标页面的路由名称
  ///[paramtes]向目标页面传的参数
  ///[callback]目标页面关闭时的回调函数
  static void pushPageAboutCircle(BuildContext context, Widget page,
      {Offset centerOffset,
        GlobalKey key,
        String routeName,
        paramtes,
        Function callback}) {
    ///通过PageRouteBuilder来自定义Rout
    PageRouteBuilder pageRouteBuilder = PageRouteBuilder(
        settings: RouteSettings(name: routeName, arguments: paramtes),

        ///页面过渡的时间
        transitionDuration: Duration(milliseconds: 2300),

        ///通过pageBuilder来构建页面
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          ///初始化动画构建器
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              ///创建裁剪路径
              return ClipPath(

                ///自定义的裁剪路径
                clipper: CirclePath(animation.value,
                    centerOffset: centerOffset, key: key),
                child: child,
              );
            },

            ///将要打开的目标页面
            child: page,
          );
        });

    ///然后通过Navigator将页面压入栈中
    Navigator.of(context).push(pageRouteBuilder).then((value) {
      //目标页面关闭时回调函数与回传参数
      if (callback != null) {
        callback(value);
      }
    });
  }

  ///从下向上打开页面
  static void openPageFromBottom(BuildContext context, Widget page,
      {bool isReplace = false,
        bool opaque = true,
        Function(dynamic value) dismissCallBack}) {
    PageRouteBuilder pageRouteBuilder = new PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          //目标页面
          return page;
        },
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,) {
          //渐变过渡动画
          return SlideTransition(
            // 从位置(-1.0, 0.0) 平移到 (0.0, 0.0)
            position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                .animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),),
            child: child,
          );
        });
    if (isReplace) {
      Navigator.of(context).pushReplacement(pageRouteBuilder);
    } else {
      Navigator.of(context).push(pageRouteBuilder).then((value) {
        if (dismissCallBack != null) {
          dismissCallBack(value);
        }
      });
    }
  }

}
