import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1528.dart
/// ListWheelScrollView 基本使用
class ListWheelScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {

  FixedExtentScrollController fixedExtentScrollController =
  new FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: Text("详情"),
      ),
      ///构建列表显示数据
      ///滚轮效果的
      body:buildWheelScrollView(),
    );
  }
  ///lib/code15/main_data1528.dart
  ///通过构造函数来创建
  Widget buildWheelScrollView(){
    ///滚轮样式的列表
    return Container(
      ///宽度
      width: MediaQuery.of(context).size.width,
      height: 400,
      ///子Widget居中
      alignment: Alignment.center,
      child: ListWheelScrollView(
        ///每个条目的高度 必传参数
        itemExtent: 45,
        ///构建所有的子Widget
        children:buildListData(),),
    );
  }
  ///lib/code15/main_data1528.dart
  ///通过Delegate方式来创建
  Widget buildWheelScrollView2(){
    return ListWheelScrollView.useDelegate(
      ///每个条目的宽度
      itemExtent: 45,
      ///子条目的构建代理
      childDelegate: ListWheelChildBuilderDelegate(
        ///子条目的个数
          childCount: 100,
          ///子条目的构建函数
          builder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              ///生成不同的颜色
              color: Colors.primaries[index % 10],
              ///子Widget居中
              alignment: Alignment.center,
              child: Text('$index'),
            );
          },
          ),
    );
  }

  List<Widget> buildListData(){
    List<Widget> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$i",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )),
            ],
          )));
    }
    return list;
  }

}