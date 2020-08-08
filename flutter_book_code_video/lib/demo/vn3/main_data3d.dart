import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PageViewHolder.dart';

///7 /lib/code20/main_data124.dart
///  Transform 图形变换
class Main3DUsePage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Main3DUsePage> {
  PageViewHolder holder;

  PageController _controller;
  double fraction = 0.50;

  List<String> imageList =[
    "assets/images/2.0x/banner1.webp",
    "assets/images/2.0x/banner2.webp",
    "assets/images/2.0x/banner3.webp",
    "assets/images/2.0x/banner4.webp",
    "assets/images/2.0x/banner5.webp",
    "assets/images/2.0x/banner6.webp",
    "assets/images/2.0x/banner7.webp",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holder = PageViewHolder(value: 2.0);
    _controller = PageController(initialPage: 2, viewportFraction: fraction);
    _controller.addListener(() {
      holder.setValue(_controller.page);
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
          child: Center(
            child: AspectRatio(
              aspectRatio: 2,
              child: ChangeNotifierProvider<PageViewHolder>.value(
                value: holder,
                child: PageView.builder(
                    controller: _controller,
                    itemCount: imageList.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {

                      String imagePath = imageList[index];
                      return MyPage(
                          number: index.toDouble(), fraction: fraction,imagePath:imagePath);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final double number;
  final double fraction;
  final String imagePath;

  MyPage({this.number, this.fraction, this.imagePath});

  @override
  Widget build(BuildContext context) {
    double value = Provider.of<PageViewHolder>(context).value;
    double diff = (number - value);

    //Matrix for Elements
    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 0.9) // Increasing Scale by 90%
      ..setEntry(1, 1, fraction) // Changing Scale Along Y Axis
      ..setEntry(3, 0, 0.005 * -diff); // Changing Perspective Along X Axis

    //Matrix for Shadow
    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.4) // Increasing Scale by 60%
      ..setEntry(3, 1, -0.008) //Changing Perspective along Y-Axis
      ..setEntry(3, 0, 0.002 * diff) // Changing Perspective along X Axis
      ..rotateX(1.309); //Rotating Shadow along X Axis

    Widget opactiy=Container();
    if(diff <= 1.0 && diff >= -1.0){
      opactiy=AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: 1 - diff.abs(),
        child: Transform(
          transform: shadowMatrix,
          alignment: FractionalOffset.bottomCenter,
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 1.0)
            ]),
          ),
        ),
      );
    }
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: <Widget>[
        opactiy,
        Transform(
          transform: pvMatrix,
          alignment: FractionalOffset.center,
          child: Container(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
