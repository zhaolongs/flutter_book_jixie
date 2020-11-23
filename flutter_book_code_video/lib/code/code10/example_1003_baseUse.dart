import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/navigator_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example1003(),
  ));
}

class Example1003 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("定时任务"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              child: Text("testError"),
              onPressed: () {
                testError();
              },
            ),
            TextButton(
              child: Text("testMicrotask"),
              onPressed: () {
                testMicrotask();
              },
            ),
            TextButton(
              child: Text("testTimeOut"),
              onPressed: () {
                testTimeOut();
              },
            ),
            TextButton(
              child: Text("testFutureAny"),
              onPressed: () {
                testFutureAny();
              },
            ),
            TextButton(
              child: Text("testdoWhile"),
              onPressed: () {
                testdoWhile();
              },
            ),


          ],
        ),
      ),
    );
  }

  ///异步任务的常用写法
  Future<String> testAsync() async {
    try {
      return "正确的值 ";
    } catch (e) {
      return "错误的值 ";
    }
  }

  /// 代码清单 10-9 Future.error
  /// lib/code/code10/example_1003_baseUse.dart
  void testError() async {
    Future.delayed(Duration(milliseconds: 1000), () {
      print("延时1秒执行");
      // return Future.value("测试数据");
      //参数一是 任意的数据类型
      //参数二是 异常信息  将会在 catchError 中的 test 函数中接收到
      return Future.error(
        "发生错误了",
        StackTrace.fromString("这里是错误消息"),
      );
    }).then((value) {
      //当延时任务正常执行时 有返回值 Future.value("测试数据")
      //或者无返回值 这里的 value 为null 都会执行到这晨
      print(" then  $value");
      return Future.value("测试数据 2");
    }).catchError((err) {
      //当上面的两个任务中有 Future.error 抛出时
      //会被这里捕捉到
      print('Caught $err'); // Handle the error.
    }, test: (e) {
      print('Caughte  $e'); // Han
      return e is String;
    }).whenComplete(() {
      print("程序执行完成");
    });
  }

  void testMicrotask() {
    Future.delayed(Duration(milliseconds: 1000), () {
      print("延时1秒执行");
      // return Future.value("测试数据");
      //参数一是 任意的数据类型
      //参数二是 异常信息  将会在 catchError 中的 test 函数中接收到
      return Future.microtask(() {
        print("测试 microtask");
        return Future.error(
          "发生错误了",
          StackTrace.fromString("这里是错误消息"),
        );
      });
    }).then((value) {
      //当延时任务正常执行时 有返回值 Future.value("测试数据")
      //或者无返回值 这里的 value 为null 都会执行到这晨
      print(" then  $value");
      return Future.value("测试数据 2");
    }).catchError((err) {
      //当上面的两个任务中有 Future.error 抛出时
      //会被这里捕捉到
      print('Caught $err'); // Handle the error.
    }, test: (e) {
      print('Caughte  $e'); // Han
      return e is String;
    }).whenComplete(() {
      print("程序执行完成");
    });
  }

  /// 代码清单 10-10 Future 对象方法概述
  /// lib/code/code10/example_1003_baseUse.dart
  void testTimeOut() async {
    //testA 是个异步任务
    testA().then((value) {
      //testA方法执行完成后执行这里
    }).timeout(Duration(milliseconds: 1000), onTimeout: () {
      //这里配置的为 1 秒
      //例如 testA异步方法中执行的时间超过了 1 1秒
      //就会回调到这里
    }).catchError((e) {
      //有 Future Error 错误时执行这里
      //或者是由 throw 关键字抛出异常时
    }).whenComplete(() {
      //最终执行的方法
    });
  }

  Future<String> testA() async {
    await Future.delayed(Duration(milliseconds: 1200));
    //耗时异步任务
    return Future.value("testA 执行完成");
  }

  Future<String> testB() async {
    await Future.delayed(Duration(milliseconds: 200));
    //耗时异步任务
    return Future.value("testB 执行完成");
  }

  void testFutureAny() async {
    String result = await Future.any([
      testA(),
      testB(),
    ]);

    print("任务执行完成 $result");
  }
  /// 代码清单 10-11 模拟的定时任务
  /// lib/code/code10/example_1003_baseUse.dart
  int _whileNumber=3;
  void testdoWhile() async {

    //用来执行一定数量的任务，如这里的定时
    await Future.doWhile(() async {
      // wait 方法用来阻塞当前 获取到另一个 Future 结果
      //      后继续执行
      //await Future.wait([testA()]);
      await Future.delayed(Duration(milliseconds: 1000));
      _whileNumber++;
      print("任务执行 doWhile $_whileNumber");
      //返回true 继续执行 反之退出
      return _whileNumber > 10 ? false : true;
    });

    print("任务执行完成 $_whileNumber");
  }



}
