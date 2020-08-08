import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/code16/main_data1603.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/7/3.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */

///lib/code16/list_item_page3.dart
///ListView中使用的子Item
class ListViewItemPage3 extends StatefulWidget {
  ///当前列表Item对应的数据模型
  ListDemoBean listDemoBean;
  ListViewItemPage3(this.listDemoBean);
  @override
  _TestPageState createState() => _TestPageState();
}


class _TestPageState extends State<ListViewItemPage3>{

  ///当前的复选框选中的标识
  bool checkBoxValue = false;
  ///当前文本输入框的控制器
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    ///页面创建的时候 设置数据
    checkBoxValue = widget.listDemoBean.isSelect;
    ///设置输入框中的内容
    controller.text = widget.listDemoBean.inputString;

  }
  @override
  void dispose() {
    super.dispose();
    ///页面销毁时 保存数据
    widget.listDemoBean.isSelect=checkBoxValue;
    ///保存输入框中的内容
    widget.listDemoBean.inputString=controller.text ;
  }
  ///lib/code16/list_item_page3.dart
  @override
  Widget build(BuildContext context) {
    ///外边灰色的容器 用来设置外边距
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(10,),
      ///用来设置内边距
      child: Container(
        padding: EdgeInsets.all(10,),
        color: Colors.white,
        ///线性布局 左右排开
        child: Row(
          children: [
            ///复选框
            Checkbox(
              ///复选框的选中标识
              value: checkBoxValue,
              ///状态改变回调函数
              onChanged: (value) {
                setState(() {
                  checkBoxValue = value;
                });
              },
            ),
            SizedBox(width: 12,),
            ///右侧的标题显示与输入框
            Expanded(
              ///线性布局上下排开
              child: Column(
                ///左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                ///线必布局 主方向 包裹子布局
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("测试数据 ${widget.listDemoBean.title}"),
                  SizedBox(
                    height: 1,
                  ),
                   ///文本输入框
                  TextField(controller: controller,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}