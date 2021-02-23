import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/10/30.
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
