///代码清单 2-10
///lib/code/code2/example_MaterialApp_205_page.dart
///配置日期组件显示为中文 MaterialApp配置中文语言环境设置
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///


//应用入口 
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(
    //加载显示的首页面
    home: MyHomePage(),
    localizationsDelegates: [

      //初始化默认的 Material 组件本地化 
      GlobalMaterialLocalizations.delegate,
      //初始化默认的 通用 Widget 组件本地化 
      GlobalWidgetsLocalizations.delegate,
    ],

    //当前区域，如果为null则使用系统区域一般用于语言切换 
    //传入两个参数，语言代码，国家代码 
    //这里配制为中国 
    locale: Locale('zh', 'CN'),

    //定义当前应用程序所支持的语言环境 
    supportedLocales: [
      const Locale('en', 'US'), // English 英文 
      const Locale('zh', 'CN'), // 中文，
    ],);
}

///代码清单 2-11
///lib/code/code2/example_MaterialApp_205_page.dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FlatButton(onPressed: () {
      //显示日期组件 
      showDatePicker(context: context,
          //初始日期设置为现在 
          initialDate: new DateTime.now(),
          //开始日期
          firstDate: new DateTime.now().subtract(new Duration(days: 30)),
          //结束日期
          lastDate: new DateTime.now().add(new Duration(days: 30))).then((
          v) {});
    }, child: Text("点击显示日期 "),),),);
  }
}