import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    home: AnimatedSwitcherPage(),
  ));
}

/// 代码清单
///代码清单
class AnimatedSwitcherPage extends StatefulWidget {
  @override
  _AnimatedSwitcherPageState createState() => _AnimatedSwitcherPageState();
}

class _AnimatedSwitcherPageState extends State<AnimatedSwitcherPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher 数字的左右移动"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 22,),
            buildAnimatedSwitcher(context),
            SizedBox(height: 22,),
            buildOutlineButton(),
          ],
        ),
      ),
    );
  }

  ///构建一个有边框的按钮
  OutlineButton buildOutlineButton() {
    return OutlineButton(
      child: const Text(
        '数据递增',
      ),
      onPressed: () {
        print(("count $_count"));
        setState(() {
          _count += 1;
        });
      },
    );
  }

  ///AnimatedSwitcher 的基本使用
  AnimatedSwitcher buildAnimatedSwitcher(BuildContext context) {
    return AnimatedSwitcher(
      ///动画执行切换时间
      duration: const Duration(milliseconds: 600),
      ///动画构建器 构建指定动画类型
      transitionBuilder: (Widget child, Animation<double> animation) {
        //执行缩放动画
        var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
        return MySlideTransition(
            child: child, position: tween.animate(animation));
      },
      ///执行动画的子 Widget
      ///只有子 Widget 被切换时才会触发动画
      child: Text(
        '$_count',
        //显示指定key，不同的key会被认为是不同的Text
        key: ValueKey<int>(_count),
        style: TextStyle(fontSize: 32),
      ),
    );
  }
}




class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //当即将执行退场动画时
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
