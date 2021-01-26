import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/utils/color_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/1.
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
///
///
///
///

void main() {
  ///启动根目录
  runApp(MaterialApp(home: TestPage(),));

}
class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

//lib/code/main_data.dart
class _TestPageState extends State<TestPage> {

  Color randColor=Colors.grey;
  Color lightRandColor=Colors.grey;
  @override
  Widget build(BuildContext context) {


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

              Container(child: Text("原色"),color: randColor,width: 100,height: 100,),

              Container(child: Text("亮色"),color: lightRandColor,width: 100,height: 100,margin: EdgeInsets.only(top: 20),),


              Container(margin: EdgeInsets.only(top: 50),child: FlatButton(child: Text("切换"),onPressed: (){
                setState(() {
                  randColor =ColorUtils.getRandomColor();

                  lightRandColor= ColorUtils.getLightColor(randColor);
                });
              },),)


            ],
          )),
    );
  }

}