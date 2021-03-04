import 'package:flutter/material.dart';
import 'package:flutter_native_message_app/src/android_view_page.dart';
import 'package:flutter_native_message_app/src/base_method_channel_page.dart';
import 'package:flutter_native_message_app/src/buffer_channel_page.dart';
import 'package:flutter_native_message_app/src/event_channel_page.dart';

import 'src/method_channel_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App 与原生测试使用 Demo"),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           OutlineButton(child: Text("MethodChannel"),onPressed: (){

             Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
               return MethodChannelPage();
             }));
           },),
            RaisedButton(child: Text("BasicMessageChannel"),onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return BasicMessagePage();
              }));
            },),
            RaisedButton(child: Text("BufferChannelPage"),onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return BufferChannelPage();
              }));
            },),
            RaisedButton(child: Text("EventChannelPage"),onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return EventChannelPage();
              }));
            },),
            RaisedButton(child: Text("AndroidViewPage"),onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return AndroidViewPage();
              }));
            },),


          ],
        ),
      ),
    );
  }
}
