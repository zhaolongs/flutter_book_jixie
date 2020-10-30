import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/30.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
///代码清单 2-43
///lib/code/code2/custom_tab.dart
class CustomTab extends StatefulWidget {
  final Function() clickCallBack;
  final IconData iconData;
  final String text;
  final bool isSelect;

  CustomTab(
      {@required this.clickCallBack,
      this.iconData,
      this.text,
      this.isSelect,
      Key key})
      : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.clickCallBack != null) {
          widget.clickCallBack();
        }
      },
      child: Container(
        height: 55,
        child: Column(//线性布局 竖起方向排开
          mainAxisAlignment: MainAxisAlignment.end, //底部对齐
          children: [
            //如果 iconData 为null 则不构建图标
            widget.iconData==null?Container():Icon(
              widget.iconData,
              //选中与未选中 图标颜色切换
              color: widget.isSelect ? Colors.blue : Colors.grey,
            ),
            Text(
              widget.text,
              //选中与未选中 文本颜色切换
              style:
                  TextStyle(color: widget.isSelect ? Colors.blue : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
