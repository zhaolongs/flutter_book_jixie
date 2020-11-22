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
    home: Example1001(),
  ));
}

class Example1001 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("async await 基本使用"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            TextButton(
              child: Text("基本使用"),
              onPressed: () {
                getData();
              },
            ),
            TextButton(
              child: Text("两个耗时任务"),
              onPressed: () {
                getData2();
              },
            )
          ],
        ),
      ),
    );
  }

  /// 代码清单 10-1 async 基本使用
  ///lib/code/code10/example_1001_baseUse.dart
  ///async关键字声明该函数内部有代码需要延迟执行
  Future<bool> getData() async {
    //模拟一个耗时操作  延时1秒
    //await关键字声明运算为延迟执行，然后return运算结果
    //await关键字声明后当前线程分阻塞在这里
    await Future.delayed(Duration(milliseconds: 1000), () {
      print("延时1秒 的操作");
    });
    print("执行完成");
    return true;
  }

  /// 代码清单 10-2 async 多个 await
  ///lib/code/code10/example_1001_baseUse.dart
  Future<bool> getData2() async {
    print("第一个耗时任务开始执行");
    //10-2-1
    //模拟一个耗时操作  延时1秒
    await Future.delayed(Duration(milliseconds: 1000), () {
      print("第一个耗时任务执行完成");
    });
    print("第二个耗时任务开始执行");

    //10-2-2
    //模拟一个耗时操作  延时2秒
    await Future.delayed(Duration(milliseconds: 1000), () {
      print("第二个耗时任务执行完成");
    });
    print("执行完成");
    return true;
  }

  /// 代码清单 10-3 async 多个 await
  ///lib/code/code10/example_1001_baseUse.dart
  Future<String> getData3() async {
    //await关键字声明运算为延迟执行，然后return运算结果
    String result = await getDataA();
    String result2 = await getDataB();
    return Future.value(result2);
  }

  Future<String> getDataA() async {
    //await关键字声明运算为延迟执行，然后return运算结果
    await Future.delayed(Duration(milliseconds: 1000), () {
      print("第一个耗时任务执行完成");
    });
    return Future.value("执行完毕");
  }

  Future<String> getDataB() async {
    //await关键字声明运算为延迟执行，然后return运算结果
    await Future.delayed(Duration(milliseconds: 1000), () {
      print("第二个耗时任务执行完成");
    });
    return Future.value("执行完毕");
  }

  /// 代码清单 10-4 async 多个 await
  ///lib/code/code10/example_1001_baseUse.dart
  Future<String> getDataA1() async {
    String result = "";
    try {
      await Future.delayed(Duration(milliseconds: 1000), () {
        print("第一个耗时任务执行完成");
      });
      result = "执行完毕";
    } catch (e) {
      result = "出现异常";
    } finally {
      return Future.value(result);
    }
  }

  Future<String> getDataB1() async {
    String result = "";
    try {
      await Future.delayed(Duration(milliseconds: 1000), () {
        print("第二个耗时任务执行完成");
      });
    } catch (e) {
      result = "出现异常";
    } finally {
      return Future.value(result);
    }
  }


}
