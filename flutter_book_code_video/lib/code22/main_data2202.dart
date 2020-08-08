import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

//lib/code22/main_data2202.dart
///
class FittedBoxPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State  {

  @override
  Widget build(BuildContext context) {
    return buildBody1();
  }

  ///页面的主体
  buildBody1() {
    return Scaffold(
      appBar: AppBar(
        title: Text("FittedBox"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(children: [

          FittedBox(
            fit: BoxFit.none,
            child: Image.asset("assets/images/2.0x/banner1.webp",width: 100,height: 50,),
          ),
          SizedBox(width: 20,),
          FittedBox(
            fit: BoxFit.none,
            child:Image.asset("assets/images/2.0x/banner1.webp",width: 100,height: 100,),
          ),
          SizedBox(width: 20,),
          FittedBox(
            fit: BoxFit.none,
            child:Image.asset("assets/images/2.0x/banner1.webp",width: 100,height: 150,),
          ),
      ],),),
    );
  }
}
