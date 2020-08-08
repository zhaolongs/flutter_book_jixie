import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 创建人： Created by zhaolong
 * 创建时间：Created by  on 2020/6/6.
 *
 * 可关注公众号：我的大前端生涯   获取最新技术分享
 * 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
 * 可关注博客：https://blog.csdn.net/zl18603543572
 */
class RadioVisualDensityPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data1202.dart
class _TestPageState extends State<RadioVisualDensityPage> {


  @override
  Widget build(BuildContext context) {

    BuildContext radioContext = globalKey.currentContext;
    if(radioContext!=null&&radioContext.findRenderObject()!=null){
      Size size = radioContext.findRenderObject().paintBounds.size;
      print("${size.toString()}");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,


      ///填充布局
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              ///buildRadioGroupColumnWidget(),
              /// buildRadioGroupRowWidget(),
              ///buildRadioGroupWidget(),
              buildRadioUseWidget(),
            ],
          )),
    );
  }

  //lib/code/main_data1202.dart
  GlobalKey globalKey = new GlobalKey();
  ///默认选中的单选框的值
  int groupValue = 0;
  ///单选框的紧凑度配置
  Radio buildRadioUseWidget() {
    return Radio(
      autofocus: false,
      key:globalKey,
      ///紧凑度
      visualDensity: VisualDensity(horizontal: 1,vertical: 1),
      materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
      ///此单选框绑定的值 必选参数
      value: 0,
      ///当前组中这选定的值  必选参数
      groupValue: groupValue,
      ///点击状态改变时的回调 必选参数
      onChanged: (v) {
        setState(() {
          this.groupValue = v;
        });
      },
    );
  }

}
