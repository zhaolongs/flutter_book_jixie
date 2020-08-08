//2.9.2 /lib/code1/main_data16.dart
//配置应用不适配的系统语言默认为英文
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//应用入口 
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(home: FirstThemPage(),
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
        const Locale('en', 'US'),// English 英文 
        const Locale('de', 'DE'), // 德语 
        const Locale('zh', 'CN'), // 中文，
      ],
      localeResolutionCallback:(Locale sysLocale, Iterable<Locale> supportedLocales) {
        //locale 反回当前系统的语言环境 
        //supportedLocales 返回 supportedLocales 中配制的语言环境支持的配置 
        //判断应用程序是否支持当前系统语言 
        List<String> locals = [];
        List<Locale> list = supportedLocales.toList();
        for(int i=0;i<list.length;i++){
          locals.add(list[i].languageCode);
        }
        //如果当前系统的语言应用程序不支持 
        //那么在这里默认返回英文环境
        if(!locals.contains(sysLocale.languageCode)){
          sysLocale = Locale('en', 'US');
        }
        return sysLocale;
      }
  );
}


class FirstThemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }

}

class FirstThemState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: FlatButton(onPressed: () {
      //显示日期组件 
      showDatePicker(context: context,
          //初始日期设置为现在 
          initialDate: new DateTime.now(),
          firstDate: new DateTime.now().subtract(new Duration(days: 30)),
          lastDate: new DateTime.now().add(new Duration(days: 30))).then((
          v) {});
    },
      child: Text("显示日期"),),),);
  }
}
