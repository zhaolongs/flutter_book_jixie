import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

///5.8 /lib/code4/main_data404.dart
/// [AnimatedDefaultTextStyle] 的使用分析
class AnimatedTextStylePage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<AnimatedTextStylePage> {
  @override
  Widget build(BuildContext context) {
    return buildBodyFunction();
  }

  bool isSelected = false;

  ///5.8 /lib/code4/main_data404.dart
  /// 文本显示组件Text
  Widget buildBodyFunction() {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画样式"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ///动画样式组件
            buildAnimatedDefaultTextStyle(),
            SizedBox(
              height: 55,
            ),
            FlatButton(
              child: Text("切换样式"),
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
            )
          ],
        ),
      ),
    );
  }
  ///5.8 /lib/code4/main_data404.dart
  ///构建动画样式组件
  AnimatedDefaultTextStyle buildAnimatedDefaultTextStyle() {
    return AnimatedDefaultTextStyle(
      ///设置Text中的文本样式
      ///每当样式有改变时会以动画的方式过渡切换
      style: isSelected
          ? TextStyle(
              fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold)
          : TextStyle(
              fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w100),
      ///动画切换的时间
      duration: const Duration(milliseconds: 200),
      ///动画执行插值器
      curve: Curves.bounceInOut,
      ///文本对齐方式
      textAlign: TextAlign.start,
      ///文本是否应该在软换行符处换行
      softWrap: true,
      ///超过文本行数区域的裁剪方式
      ///设置设置为省略号
      overflow: TextOverflow.ellipsis,
      ///最大显示行数
      maxLines: 1,
      ///每当样式有修改触发动画时
      ///动画执行结束的回调
      onEnd: () {
        print("动画执行结束");
      },

      ///文本组件
      child: Text("Hello, Flutter"),
    );
  }
}
