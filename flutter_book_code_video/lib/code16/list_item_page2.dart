import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/3.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class ListViewItemPage2 extends StatefulWidget {
  int pageIndex ;

  ListViewItemPage2(this.pageIndex);

  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<ListViewItemPage2>{

  @override
  void initState() {
    super.initState();
    print("页面创建 ${widget.pageIndex}");
  }
  @override
  void dispose() {
    super.dispose();
    print("页面销毁 ${widget.pageIndex}");
  }

  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10,),
      child: Row(children: [
        Checkbox(value: checkBoxValue,onChanged: (value){
          setState(() {
            checkBoxValue = value;
          });
        },),
        SizedBox(width: 12,),
        Text("测试数据 ${widget.pageIndex}")
      ],),
    );
  }

}