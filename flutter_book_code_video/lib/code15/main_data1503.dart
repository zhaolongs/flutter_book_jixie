import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/27.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code15/main_data1503.dart
///滚动控制器 [ScrollController]
class ScrollBaseUsePage3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollHomePageState();
  }
}

class ScrollHomePageState extends State {

  ///第一步
  ///创建控制器
  ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    ///第二步
    ///添加滚动监听
    scrollController.addListener(() {
      ///滚动时会实时回调这里
      ///获取滚动的距离
      double offsetValue =  scrollController.offset;
      if(offsetValue<=0){
        print("滚动到了顶部");
      }else if (offsetValue==scrollController.position.maxScrollExtent){
        print("滚动到了底部");
      }else{
        print("滑动的距离  $offsetValue");
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
    // 为了避免内存泄漏，需要调用 dispose
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("详情"),
      ),
      ///使用滑动布局包裹页面主体内容
      body: SingleChildScrollView(
        ///第三步
        ///配制滑动控制器
        controller: scrollController,
        ///子Widget
        child: buidChildWidget(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        scrollToWidgetPostion(textGlobalKey);
      },child: Icon(Icons.arrow_upward),),
    );
  }

  ///lib/code15/main_data1503.dart
  ///滚动到顶部
  void scrollToTop(){
    scrollOffset(0.0);
  }

  ///滚动到底部
  void scrollToBottom(){
    ///获取scrollController最大的可滑动距离
    double maxScroll =scrollController.position.maxScrollExtent;
    scrollOffset(maxScroll);
  }

  ///滑动到指定的Widget的位置
  void scrollToWidgetPostion(GlobalKey key){
    ///根据 key 来获取指定的Widget的位置信息
    BuildContext stackContext = key.currentContext;
    if(stackContext!=null){
      RenderBox renderBox = stackContext.findRenderObject();
      if(renderBox!=null){
        ///获取指定的Widget的位置信息
        ///相对于全局的位置
        Offset offset = renderBox.localToGlobal(Offset.zero);
        ///获取指定的Widget的大小 信息
        Size size =renderBox.paintBounds.size;
        print("获取指定的Widget的位置信息 $offset  获取指定的Widget的大小 $size");
        ///滑动到这个Widget的位置
        scrollOffset(offset.dy);
      }
    }
  }


  ///滚动到指定的位置
  void scrollOffset(double offset){
    // 返回到顶指定位置
    scrollController.animateTo(offset,
      // 返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，
      duration: Duration(milliseconds: 200),
      ///动画曲线是Curves.ease
      curve: Curves.ease,
    );
  }

  GlobalKey textGlobalKey = new GlobalKey();
  ///超出显示内容区域的Widget
  ///在实际项目开发中
  ///可能是很庞大的内容体系
  Widget buidChildWidget (){
   return  Container(
     width: 800,
     height: 1800,
     alignment: Alignment.bottomCenter,
     color: Colors.grey,
     child: Text("这里是 SingleChildScrollView",key: textGlobalKey,),
   );
  }
}