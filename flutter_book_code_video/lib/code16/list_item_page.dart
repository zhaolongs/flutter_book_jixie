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

///lib/code16/list_item_page.dart
///用于ListView中显示的子Item
class ListViewItemPage extends StatefulWidget {
  ///ListView中显示的位置 从0开始
  final int pageIndex ;
  ///构建函数
  ListViewItemPage(this.pageIndex);

  @override
  _TestPageState createState() => _TestPageState();
}

///在这里需要注意需要继承AutomaticKeepAliveClientMixin
class _TestPageState extends State<ListViewItemPage>
    with AutomaticKeepAliveClientMixin {

  ///当前页面中的Checkbox的选中标识
  bool checkBoxValue = false;

  ///返回true 页面保活
  @override
  bool get wantKeepAlive => true;

  ///页面初始化创建方法
  @override
  void initState() {
    super.initState();
    print("页面创建 ${widget.pageIndex}");
  }
  ///页面销毁的方法
  @override
  void dispose() {
    super.dispose();
    print("页面销毁 ${widget.pageIndex}");
  }

  @override
  Widget build(BuildContext context) {
    ///调用父组件的build方法
    super.build(context);

    return Container(
      ///设置内边距
      padding: EdgeInsets.all(10,),
      ///线性布局排开
      child: Row(
        children: [
          ///复选框组件
          Checkbox(
            ///当前复选框的选中标识
            value: checkBoxValue,
            ///筛选框的状态变动
            ///value为true时选中
            ///value为false时未选中
            onChanged: (value) {
              setState(() {
                checkBoxValue = value;
              });
            },
          ),
          SizedBox(
            width: 12,
          ),
          Text("测试数据 ${widget.pageIndex}")
        ],
      ),
    );
  }
}