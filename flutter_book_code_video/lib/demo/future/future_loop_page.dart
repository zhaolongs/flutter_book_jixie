import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/8/8.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423
///延时操作
class FutureDelayedTestPage extends StatefulWidget {
  @override
  _FutureDelayedTestPageState createState() => _FutureDelayedTestPageState();
}

//lib/code/main_data.dart
class _FutureDelayedTestPageState extends State<FutureDelayedTestPage> {

  @override
  void initState() {

    super.initState();
//    test();
  test2();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
            ],
          )),
    );
  }

  ///延时执行
  void test() async{
    ///参数一 延时的时间
    ///参数二 延时执行的方法
    Future.delayed(Duration(milliseconds: 1000), () {
      print("延时1秒执行");
      return Future.value("测试数据");
    });


    Future.delayed(Duration(milliseconds: 1000)).whenComplete((){
      print("延时1秒执行 whenComplete ");
    });

    Future.delayed(Duration(milliseconds:1000)).then((value){
      print("延时1秒执行 then ");
    });

    await Future.delayed(Duration(milliseconds:1000));
    ///在这处理延时1秒的操作
    print("await 处理的延时1秒的任务");
  }

  void delayedFunction(){

  }

  void test2() {
    Future.delayed(Duration(milliseconds: 1000), () {
      print("延时1秒执行");
      return Future.value("测试数据");
    }).then((value) {//函数一
      print(" then  $value");
      return Future.value("测试数据 2");
    }).then((value) {///函数二
      print(" then  $value");
      throw 'Error!';
      return Future.value("测试数据 3");
    }).then((value) {//函数三
      ///value 就是 函数一中回传的值
      print(" then  $value");
    }).catchError((err) {
      print('Caught $err'); // Handle the error.
    },test: (e){
      print('Caughte  $e'); // Han
      return e is String;
    }).whenComplete((){
      print("程序执行完成");
    });


  }

  void test3(){
    ///延时2秒
    Timer timer =  new Timer(Duration(milliseconds: 2000), (){

    });
  }
}