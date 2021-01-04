import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/

///加载无数据显示组件
///lib/src/page/common/common_nodata_widget.dart
class NoDataWidget extends StatelessWidget {
  final Function clickCallBack;
  final Color textColor;

  NoDataWidget({
    this.clickCallBack,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //圆角背景
        InkWell(
          onTap: clickCallBack,
          child: Container(
            //大小
            //内边距
            padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
            child: Row(
              // 包裹子Widget
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Icon(
                    Icons.mood,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '暂无数据 点击刷新',
                  style: TextStyle(fontSize: 14,color: textColor),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
