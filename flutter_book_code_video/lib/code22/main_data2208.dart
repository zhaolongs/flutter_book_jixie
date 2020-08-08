import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/5.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

/// 异步加载组件的基本使用
class FutureBuilderPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code22/main_data2208.dart
/// 异步加载组件的基本使用
class _TestPageState extends State {
  ///这里的泛型就是异步加载的数据类型
  ///可自定义
  Future<String> _loadingFuture;

  @override
  void initState() {
    super.initState();
    _loadingFuture = loadingDataFunction();
  }

  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("异步加载数据"),),
      body: FutureBuilder<String>(
        //future：这个参数需要一个Future 对象，类似于 网络请求、IO
        future: _loadingFuture,
        ///这里的数据格式与上述FutureBuilder设置的泛型格式一至
        initialData: "初始化的数据",
        ///构建显示的 Widget  会根据加载的状态来多次回调些方法
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          //加载状态判断
          switch (snapshot.connectionState) {

            ///可理解为初始加载显示的 Widget 异步加载开始时的回调
            case ConnectionState.none:
              return  Text('Result: ${snapshot.data}');

            ///异步加载中的回调
            case ConnectionState.active:
            case ConnectionState.waiting:
              return CircularProgressIndicator();

            ///异步加载完成的回调
            case ConnectionState.done:
              //判断是否加载失败
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                ///通过 [snapshot.data]来获取异步加载的数据
                return Text('Result: ${snapshot.data}');
              }
          }
          return null;
        },
      ),
    );
  }

  ///模拟耗时的网络请求
  Future<String> loadingDataFunction() async {
    ///模拟
    await Future.delayed(Duration(milliseconds: 4000));

    return Future.value("加载成功");
  }
}
