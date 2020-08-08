import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildClick(Widget widget, Function() clickCallBack) {
  return InkWell(
    child: widget,
    onTap: clickCallBack,
  );
}

Widget buildContainerAndClick(String str, Function() clickCallBack) {
  return InkWell(
    onTap: clickCallBack,
    child: Container(
      color: Color(0xFFE0E0E0),
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.all(8),
      child: Text(str),
    ),
  );
}



