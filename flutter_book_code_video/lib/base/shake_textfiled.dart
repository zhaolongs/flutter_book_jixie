import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';


/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/11/10.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
/// 
/// 代码清单 
///代码清单
///代码清单 3-32 抖动的输入框
///lib/base/shake_textfiled.dart
class ShakeTextFiled extends StatefulWidget {
  final String labelText;
  final Stream stream;
  final ShakeAnimationController shakeAnimationController;
  final FocusNode focusNode;
  final TextEditingController textFieldController;
  final Function(String value) onSubmitted;

  ShakeTextFiled(
      {@required this.labelText,
        @required this.stream,
        @required this.shakeAnimationController,
        this.focusNode,
        @required this.textFieldController,
        this.onSubmitted,
        Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShakeTextFiled();
  }
}

class _ShakeTextFiled extends State<ShakeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return ShakeAnimationWidget(
          //微左右的抖动
          shakeAnimationType: ShakeAnimationType.LeftRightShake,
          //设置不开启抖动
          isForward: false,
          //抖动控制器
          shakeAnimationController: widget.shakeAnimationController,
          child: new TextField(
            //焦点控制
            focusNode: widget.focusNode,
            //文本控制器
            controller: widget.textFieldController,
            //键盘回车键点击回调
            onSubmitted: widget.onSubmitted,
            //边框样式设置
            decoration: InputDecoration(
              //红色的错误提示文本
              errorText: snapshot.data,
              labelText: widget.labelText,
              //设置上下左右 都有边框
              //设置四个角的弧度
              border: OutlineInputBorder(
                //设置边框四个角的弧度
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        );
      },
    );
  }
}
