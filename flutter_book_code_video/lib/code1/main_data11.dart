// 2.7/lib/code1/main_data10.dart
//样式ThemData精讲 theme 属性配置使用import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>runApp(themDataFunction());

MaterialApp themDataFunction(){
  return MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        primaryColor: Colors.deepPurple
    ),
    themeMode:ThemeMode.light,
    darkTheme: ThemeData(
        brightness: Brightness.dark
    ),

    home: FirstPage(),
  );
}



class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController= new TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'tootips',
          onPressed: () => debugPrint('Navigreation button is pressed'),
        ),
        title: Text('导航'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: () => debugPrint('Search button is pressed'),
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            tooltip: '更多',
            onPressed: () => debugPrint('More button is pressed'),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.message)),
            Tab(icon: Icon(Icons.library_add)),
          ],
        ),
      ),
      body: Column(children: <Widget>[
        Container(height: 200, width: 200),
        SizedBox(height: 20,),
        FlatButton(child: Text("这是一个Button"), onPressed: () {},),
        SizedBox(height: 20,),
        Switch(value: true, onChanged: (bool value) {},),
        Checkbox(onChanged: (bool value) {  }, value: true,),
        Radio(groupValue: 1, onChanged: (int value) {  }, value: 2,),
      ],),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child:Icon(Icons.add) ,),
    );
  }

}