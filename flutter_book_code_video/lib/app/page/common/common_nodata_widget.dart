import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/23.
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



class NoDataWidget extends StatelessWidget {
  final Function clickCallBack;
  NoDataWidget({this.clickCallBack});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        //圆角背景
        InkWell(
          onTap:clickCallBack,
          child: Container(
            //大小
            //内边距
            padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
            child: Row(
              // 包裹子Widget
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width:  22 ,
                  height:  22 ,
                  //苹果风格的一个小进度圆圈
                  child: Icon(Icons.mood,color: Colors.amber,),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  '暂无数据 点击刷新',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

