
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbookcode/demo/boxbar/flip_bar_item.dart';
import 'package:flutterbookcode/demo/boxbar/flip_box_bar.dart';



///4.1.5  /lib/code3/main_data65-1.dart
/// MediaQuery解析
class Bottom3DBarPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<Bottom3DBarPage>{

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(), //
      bottomNavigationBar: FlipBoxBar(
        selectedIndex: selectedIndex,
        items: [
          FlipBarItem(
              icon: Icon(Icons.map),
              text: Text("Map"),
              frontColor: Colors.blue,
              backColor: Colors.blueAccent),
          FlipBarItem(
              icon: Icon(Icons.add),
              text: Text("Add"),
              frontColor: Colors.cyan,
              backColor: Colors.cyanAccent),
          FlipBarItem(
              icon: Icon(Icons.chrome_reader_mode),
              text: Text("Read"),
              frontColor: Colors.orange,
              backColor: Colors.orangeAccent),
          FlipBarItem(
              icon: Icon(Icons.print),
              text: Text("Print"),
              frontColor: Colors.purple,
              backColor: Colors.purpleAccent),
          FlipBarItem(
              icon: Icon(Icons.print),
              text: Text("Print"),
              frontColor: Colors.pink,
              backColor: Colors.pinkAccent),
        ],
        onIndexChanged: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
      ),
    );
    }


}