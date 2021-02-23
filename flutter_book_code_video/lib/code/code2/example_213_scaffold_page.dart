import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
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
///
///


//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example213(),
  ));
}


class Example213 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example213> {




  List<Widget> bodyWidgetList=[
    ScffoldHomeItemPage(0),
    ScffoldHomeItemPage(1),
    ScffoldHomeItemPage(2),
  ];


  @override
  Widget build(BuildContext context) {
    //Scaffold 用来搭建页面的主体结构
    return Scaffold(
      //页面的头部
      appBar: AppBar(
        title: Text("底部菜单栏切换页面"),
      ),
      //页面的主内容区
      //可以是单独的StatefulWidget 也可以是当前页面构建的如Text文本组件
      body: Center(
        child: bodyWidgetList[_tabIndex],
      ),
      //底部导航栏
      bottomNavigationBar: buildBottomNavigation(),
    );
  }


  //选中的当前的标签的索引
  int _tabIndex = 0;

  //底部导航栏使用到的图标
  List<Icon> normalIcon = [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];

  //底部导航栏使用到的标题文字
  List<String> normalTitle = ["首页", "消息", "我的"];

  //构建底部导航栏
  BottomNavigationBar buildBottomNavigation() {
    //创建一个 BottomNavigationBar
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: normalIcon[0], title: Text(normalTitle[0])),
        new BottomNavigationBarItem(
            icon: normalIcon[1], title: Text(normalTitle[1])),
        new BottomNavigationBarItem(
            icon: normalIcon[2], title: Text(normalTitle[2])),
      ],
      //显示效果
      type: BottomNavigationBarType.fixed,
      //当前选中的页面
      currentIndex: _tabIndex,
      //导航栏的背景颜色
      backgroundColor: Colors.white,
      //选中时图标与文字的颜色
//      fixedColor: Colors.deepPurple,
      //选中时图标与文字的颜色
      selectedItemColor: Colors.blue,
      //未选中时图标与文字的颜色
      unselectedItemColor: Colors.grey,
      //图标的大小
      iconSize: 24.0,
      //点击事件
      onTap: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }

}


class ScffoldHomeItemPage extends StatefulWidget {
  //页面标识
  final int pageIndex;
  //构造函数
  ScffoldHomeItemPage(this.pageIndex,{Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ScffoldHomeItemState();
  }
}

class ScffoldHomeItemState extends State<ScffoldHomeItemPage> {
  //页面创建时初始化函数
  @override
  void initState() {
    super.initState();
    print("页面创建${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("当前页面标识为${widget.pageIndex}"),
    );
  }

  //页面销毁时回调函数
  @override
  void dispose() {
    super.dispose();
    print("页面消失${widget.pageIndex}");
  }
}
