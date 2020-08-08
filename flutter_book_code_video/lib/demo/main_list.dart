import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///7 /lib/code20/main_data124.dart
///  Transform 图形变换
class Main3DUsePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Main3DUsePage> {


  ScrollController  scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Perspective PageView"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(),
              Expanded(
                child:
                    ListView.builder(controller: scrollController,itemBuilder: (BuildContext co, int index) {
                  ///
                  List item = [4, 5, 6, 7];

                  List<Widget> list = [];
                  for (int i = 0; i < item.length; i++) {
                    Widget itemWidget = Row();
                    list.add(itemWidget);
                  }

                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Row(),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: list,
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
