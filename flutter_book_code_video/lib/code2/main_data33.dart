

//drawer配制侧拉页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//应用入口 
main() => runApp(themDataFunction());
MaterialApp themDataFunction() {
  return MaterialApp(
    home: FirstPage6(),);
}
class FirstPage6 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstThemState();
  }
}
//3.3.3 /lib/code2/main_data33.dart
//按钮点击打开与关闭侧拉页面 修改默认配置到AppBar上的按钮
class FirstThemState extends State<FirstPage6> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //左侧侧拉页面
      drawer: buildDrawer(),
      //右侧侧拉页面
      endDrawer: buildDrawer(),
      //页面的头部
      appBar: AppBar(title: Text("标题"),
        leading: InkWell(onTap: (){

        },child: Icon(Icons.add),),),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(child: Text("显示日期"),),
    );
  }



  //3.3 /lib/code2/main_data32.dart
//drawer配制侧拉页面 自定义的DrawerHeader
  Container buildDrawer() {
    //Container可看做是一个容器，用来包裹一些Widget
    return Container(
      //背景颜色
      color: Colors.white,
      width: 200,
      //Column可以让子Widgt在垂直方向线性排列
      child: Column(
        children: <Widget>[
          DrawerHeader(
            //设置Header的上下左右内边距为0
            padding: EdgeInsets.zero,
            //显示的具体的内容
            child: buildDrawerBody(),
            //侧拉页面滑出的动画效果 先快后慢
            curve: Curves.fastOutSlowIn,
          ),
        ],
      ),
    );
  }

//Stack为帧布局页面Widget可重合显示
  Stack buildDrawerBody() {
    return Stack(
      children: <Widget>[
        //可以用来设置背景图片
        Container(color: Colors.grey,),
        //Align用来对齐组件
        Align(
          //底部左对齐
          alignment: FractionalOffset.bottomLeft,
          //设置用户的显示信息
          child: Container(
            //底部外边跑为12
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              children: <Widget>[
                SizedBox(width: 12,),
                //圆形的头像
                CircleAvatar(
                  child: Icon(Icons.message),
                ),
                SizedBox(width: 16,),
                Column(

                  //使用Column线性布局包裹子Widget大小
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("这里是用户的姓名了"),
                    SizedBox(height: 8,),
                    Text("这里是用户的简介了"),
                  ],
                ),
              ],
            ),),)
      ],
    );
  }


}
