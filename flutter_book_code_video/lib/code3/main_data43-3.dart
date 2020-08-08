//4.1.1 /lib/code3/main_data43.dart
//4.1.1线性布局Row在属性title中的使用


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//4.1.3 /lib/code3/main_data43-2.dart
//Row标签结合PageView实现滑动切换
///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: TabFromRowPage3(),));

class TabFromRowPage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}
///4.1.4 /lib/code3/main_data43-3.dart
class FirstPagetate extends State<TabFromRowPage3>  with SingleTickerProviderStateMixin{

  ///当前显示标签页面的标识 0为推荐标签页面  1为专栏标签页面
  int currentSelectIndex = 0;
  ///保存页面的List
  List<Widget> pageList=[];
  ///4.1.4 /lib/code3/main_data43-3.dart
  /// 初始化控制器
  TabController tabController;

  @override
  void initState() {
    super.initState();
    ///创建控制器的实例
    tabController = new TabController(
      ///默认显示的标签页面
      initialIndex: 0,
     ///标签页面的个数
     length: 2,
      ///动画滑动代理
      vsync: this,
    );

    ///TabBar设置滑动监听
    tabController.addListener(() {
      //PageView滑动的距离
      double offset = tabController.offset;
      ///上一个显示页面的角标
      int preIndex = tabController.previousIndex;
      ///当前显示页面的角标
      int index = tabController.index;
      ///页面是否改变
      bool indexIsChanging = tabController.indexIsChanging;
        setState(() {
          currentSelectIndex = index;
        });
      print("pageView 滑动的距离 $offset  上一个页面 $preIndex 当前页面 $index  是否改变 $indexIsChanging");
    });

    ///保存标签页面
    pageList=[
      LeftPage(),
      RightPage(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(title: buildAppBarTitle(), centerTitle: true,),
      ///页面的主内容区
      ///根据currentSelectIndex动态加载
      body: buildBodyFunction());
  }

  ///4.1.4 /lib/code3/main_data43-3.dart
  ///构建标签栏
  Row buildAppBarTitle() {
    //Row为线性布局，它可以使子Widget在水平方向线性排列
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///InkWell用来配置标签的点击事件
        InkWell(onTap: () {
          setState(() {
            currentSelectIndex = 0;
//            tabController.animateTo(0, duration: Duration(milliseconds: 200), curve: Curves.linear);
            tabController.index=0;
          });
        }, child:
        Container(
          ///设置内边距
          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6, right: 10),
          ///设置文字显示
          child: Text("推荐", style: TextStyle(
              ///动态加载文字颜色
              color: currentSelectIndex == 0 ? Colors.red : Colors.grey),),
          ///设置圆角边框
          decoration: BoxDecoration(
            ///动态加载标签背景颜色
              color: currentSelectIndex == 0 ? Colors.white : Color(0xFFEEEEEE),
              ///分别设置边框的上下左右四个角的圆角
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4))),),),
        InkWell(onTap: () {
          setState(() {
            currentSelectIndex = 1;
//            tabController.animateTo(currentSelectIndex, duration: Duration(milliseconds: 200), curve: Curves.linear);
          tabController.index=1;
          });
        }, child:
        Container(
          padding: EdgeInsets.only(left: 10, top: 6, bottom: 6, right: 20),
          child: Text("专栏", style: TextStyle(
              color: currentSelectIndex == 1 ? Colors.red : Colors.grey),),
          decoration: BoxDecoration(
              color: currentSelectIndex == 1 ? Colors.white : Color(0xFFEEEEEE),
              borderRadius: BorderRadius.only(topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),),
        )
      ],
    );
  }

  ///4.1.4 /lib/code3/main_data43-3.dart
  ///Row标签结合TabBarView实现滑动切换
  ///封装方法构建PageView组件
  TabBarView buildBodyFunction() {
    ///可实现左右页面滑动切换
    return TabBarView(
      //控制器
     controller: tabController,
      //滑动到页面底部无回弹效果
      physics: BouncingScrollPhysics(),
      //所有的子Widget
      children: pageList,
    );
  }



}


class LeftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,body: Center(child: Text("推荐页面"),),);
  }
}

class RightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("专栏页面"),),);
  }
}