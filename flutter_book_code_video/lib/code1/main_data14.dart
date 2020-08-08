//2.9.1 /lib/code1/main_data14.dart
//配置日期组件显示为中文 默认创建的项目
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//应用入口 
main() => runApp(themDataFunction());

MaterialApp themDataFunction() {
  return MaterialApp(home: FirstThemPage(),);
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
