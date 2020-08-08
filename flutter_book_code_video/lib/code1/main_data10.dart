// 2.7/lib/code1/main_data10.dart
//样式ThemData精讲 theme 属性配置使用import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>runApp(themDataFunction());

MaterialApp themDataFunction(){
  return MaterialApp(
    theme: ThemeData(),
    themeMode:ThemeMode.dark,
    darkTheme: ThemeData(),
    home: FirstPage(),
  );
}


void bookCode1(){
  MaterialApp(
    theme: ThemeData(),
    themeMode: ThemeMode.dark,
    darkTheme: ThemeData()
    ,);

  MaterialApp(
    theme: ThemeData(),
    themeMode: ThemeMode.light,
    darkTheme: ThemeData()
    ,);

}


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
      ),
    );
  }

}