
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



///应用入口 
main() =>
    runApp(
        MaterialApp(
          home: FirstPage(),));

//4.3 /lib/code3/main_data49.dart
//4.3 AppBar的bootom属性
class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPagetate();
  }
}

class FirstPagetate extends State<FirstPage>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }


//4.2 /lib/code3/main_data50.dart
//4.2 AppBar的bootom属性 中使用 PreferredSize

  @override
  Widget build(BuildContext context) {
    ///Scaffold 用来搭建页面的主体结构
    return Scaffold(
      ///标题
      appBar: AppBar(
        title: Text("TabBar"),
        bottom: buildAppBarTitle(),
        ///标题居中
        centerTitle: true,),
      ///页面的主内容区
      body: Center(child: Text("TabBar 的基本使用"),),);
  }

  //构建TabBar
  PreferredSize buildAppBarTitle() {
    //PreferredSize
    return PreferredSize(
      ///bottom的高度设置
      preferredSize: Size.fromHeight(44),
      ///bottom的子widget
      child: Container(
        color: Colors.white,
        height: 44,
        child:
        Row(
          ///子布局居中
          mainAxisAlignment: MainAxisAlignment.center,
          ///两个子木筏，
          children: [
            Text("测试标签1"),
            ///SizedBox 这里可理解为是用来填充空间的
            SizedBox(width: 20,),
            Text("测试标签2"),
          ],),),
    );
  }

}
