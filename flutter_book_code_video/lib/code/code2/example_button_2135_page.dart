import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///

///代码清单 2-16
///lib/code/code2/example_scaffold_207_page.dart
///Scaffold的基本使用 内容主体页面
import 'package:flutter/painting.dart';

//应用入口
void main() {
  ///启动根目录
  runApp(MaterialApp(
    home: Example2135(),
  ));
}

///代码清单 2-159
///lib/code/code2/example_button_2135_page.dart
class Example2135 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExampleState();
  }
}

class _ExampleState extends State<Example2135> {
  @override
  Widget build(BuildContext context) {
    //定义菜单按钮选项
    List<Icon> iconList = [
      Icon(Icons.add),
      Icon(Icons.save),
      Icon(Icons.share),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("悬浮按钮"),
      ),
      backgroundColor: Colors.white,
      //填充屏幕空间
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: [
            //向上弹出的按钮组件
            RoteFloatingButton(
              //子菜单按钮选项
              iconList: iconList,

              ///子菜单按钮的点击事件回调
              clickCallback: (int index) {
                print("点击了按钮$index");
              },
            ),
          ],
        ),
      ),
    );
  }

  ///代码清单 2-134
  ///lib/code/code2/example_button_2135_page.dart
}

////旋转变换按钮 向上弹出的效果
class RoteFloatingButton extends StatefulWidget {
  //菜单按钮选项
  final List<Icon> iconList;

  //按钮的点击事件
  final Function(int index) clickCallback;

  RoteFloatingButton({this.iconList, this.clickCallback});

  @override
  _RoteButtonPageState createState() => _RoteButtonPageState();
}

////旋转变换按钮 向上弹出的效果 State实现
class _RoteButtonPageState extends State<RoteFloatingButton>
    with SingleTickerProviderStateMixin {
  //记录是否打开
  bool isOpened = false;

  //动画控制器
  AnimationController _animationController;

  //颜色变化取值
  Animation<Color> _animateColor;

  //图标变化取值
  Animation<double> _animateIcon;

  //按钮的位置动画
  Animation<double> _translateButton;

  //动画执行速率
  Curve _curve = Curves.easeOut;

  double _fabHeight = 56.0;

  @override
  initState() {
    super.initState();
    //初始化动画控制器
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    //添加动画监听
    _animationController.addListener(() {
      setState(() {});
    });
    //Tween结合_animationController，使300毫秒内执行一个从0.0到0.1的变换过程
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    //结合_animationController 实现一个从Colors.blue到Colors.deepPurple的动画过渡
    _animateColor = ColorTween(
      begin: Colors.blue,
      end: Colors.deepPurple,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    //构建子菜单
    List<Widget> itemList = [];
    for (int i = 0; i < widget.iconList.length; i++) {
      //通过Transform来促成FloatingActionButton的平移
      itemList.add(
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * (widget.iconList.length - i),
            0.0,
          ),
          child: FloatingActionButton(
            heroTag: "$i",
            onPressed: () {
              //点击菜单子选项要求菜单弹缩回去
              floatClick();
              if (widget.clickCallback != null) {
                widget.clickCallback(i);
              }
            },
            child: widget.iconList[i],
          ),
        ),
      );
    }
    //添加菜单按钮
    itemList.add(floatButton());

    return Positioned(
      right: 10,
      bottom: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: itemList,
      ),
    );
  }

  //构建固定旋转菜单按钮
  Widget floatButton() {
    return new Container(
      child: FloatingActionButton(
        //通过_animateColor实现背景颜色的过渡
        backgroundColor: _animateColor.value,
        onPressed: floatClick,
        //通过AnimatedIcon实现标签的过渡
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  //FloatingActionButton的点击事件，用来控制按钮的动画变换
  floatClick() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  //页面销毁时，销毁动画控制器
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
