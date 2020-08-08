import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

///lib/code1/main_data13.dart
//ChangeNotifier 消息监听者与notifyListeners()结合实现消息通信 
//类似iOS中的notify与Android中的广播 
class TestModel extends ChangeNotifier {
  //个人认为这种思想起源于Java中的面向对象 
  String _testTitle = "这是模型1初始化数据";

  String get getTestTitle => _testTitle;

  //外部调用 修改文字的方法 
  void updateText(String message) {
    _testTitle = message;
    //发送文本修改的消息通知 
    notifyListeners();
  }
}

class TestModel2 extends ChangeNotifier {
  String _testTitle = "这是模型2初始化数据";

  String get getTestTitle => _testTitle;

  //外部调用 修改文字的方法 
  void updateText(String message) {
    _testTitle = "这里是testMode2的数据$message";
    //发送文本修改的消息通知 
    notifyListeners();
  }
}


void main() {
  //程序入口函数
  runApp(
    MultiProvider(
      child: MyProvideApp(),
      providers: [
        //在这里可配置多个数据模型的Provider
        //将Provider配制在程序的最顶层
        ChangeNotifierProvider<TestModel>.value(
          //value就是监听的数据模型对象
          value: TestModel(),
          //这里最好是根widget
        ),
        //在这里还可以配置其他的ChangeNotifierProvider

      ],),

  );
}

//浅谈Provider进行状态管理 引用数据并实现数据的修改
class MyProvideApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyProvideApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: Column(
      mainAxisSize: MainAxisSize.min, children: <Widget>[

      //这里通过调用 Provider.of<TestModel>(context).getTestTitle 来获取数据
      //这里通过<>中配置的泛型类别来区分所识别的数据模型
      Consumer<TestModel>(
        builder: (BuildContext context, TestModel value, Widget child) {
          return Text("测试模型1的数据 Consumer:${value.getTestTitle}");
        },
      ),
      Text("测试模型2的数据：${Provider
          .of<TestModel2>(context)
          .getTestTitle}"),
      //SizedBox用来占一个高度为30的空位
      SizedBox(height: 30,),
      //FlatButton 这是一个按钮
      FlatButton(child: Text("点击修改文本"), onPressed: () {
        //Provider.of<TestModel>(context, listen: false)来调用updateText方法更新数据;
        //这里通过<>中配置的泛型类别来区分所识别的数据类型
        Provider.of<TestModel>(context, listen: false).updateText("哈哈 我来了");
      },),
      FlatButton(child: Text("点击修改文本"), onPressed: () {
        //Provider.of<TestModel>(context, listen: false)来调用updateText方法更新数据;
        //这里通过<>中配置的泛型类别来区分所识别的数据类型
        Provider.of<TestModel2>(context, listen: false).updateText("哈哈 我来了");
      },)

    ],),),));
  }
}


class TestMultiProviderConsumerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestProviderPageState();
  }

}

///lib/code1/main_data13.dart
/// [MultiProvider]的基本使用
class _TestProviderPageState extends State {
  @override
  Widget build(BuildContext context) {
    //一般将Provider配制在程序的最顶层
    return MultiProvider(

      ///配制的多种 provider
      ///在这里可配置多个数据模型的Provider
      providers: [
        //将Provider配制在程序的最顶层
        ChangeNotifierProvider<TestModel>.value(
          //value就是监听的数据模型对象
          value: TestModel(),
        ),
        ChangeNotifierProvider<TestModel2>.value(
          //value就是监听的数据模型对象
          value: TestModel2(),
        ),
        //在这里还可以配置其他的ChangeNotifierProvider
        ///....
      ],

      ///对应的子Widget
      child: MyProvideApp(),
    );
  }
}