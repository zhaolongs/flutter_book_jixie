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
/// https://study.163.com/instructor/1021406098.htm
/// https://blog.csdn.net/zl18603543572
/// https://www.toutiao.com/c/user/token/MS4wLjABAAAAYMrKikomuQJ4d-cPaeBqtAK2cQY697Pv9xIyyDhtwIM/
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