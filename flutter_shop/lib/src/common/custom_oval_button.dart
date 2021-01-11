import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/11.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-12
///自定义圆形按钮
///lib/src/common/custom_oval_button.dart
class CustumOvalButton extends StatefulWidget {
  //图标图片路径
  final String assetPath;
  //点击事件回调
  final Function() clickCallBack;

  CustumOvalButton({
    @required this.assetPath,
    this.clickCallBack,
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustumOvalButtonState();
  }
}

class _CustumOvalButtonState extends State<CustumOvalButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //点击事件的响应范围
      borderRadius: BorderRadius.all(Radius.circular(30)),
      //点击事件
      onTap: widget.clickCallBack,
      child: Container(
        width: 50,
        height: 50,
        padding: EdgeInsets.all(10),
        //自定义边框
        decoration: BoxDecoration(
          //边框
          border: Border.all(color: Colors.grey),
          //边框圆角
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Image.asset(
          widget.assetPath,
          //图标颜色
          color: Colors.black87,
        ),
      ),
    );
  }
}
