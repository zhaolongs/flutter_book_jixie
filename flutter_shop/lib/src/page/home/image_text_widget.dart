import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2021/1/4.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
///代码清单 13-32
///lib/src/page/home/image_text_widget.dart
///文字与图标在竖直方向线性排列
class ImageTextWidget extends StatelessWidget {
  final String image;
  final Function onTap;

  ImageTextWidget({
    @required this.image,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //点击事件
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          //包裹
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 20,
              width: 22,
              fit: BoxFit.fill,
            ),
            Text(
              "消息",
              style: TextStyle(fontSize: 8, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
