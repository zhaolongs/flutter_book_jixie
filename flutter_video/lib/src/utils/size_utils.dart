



import 'package:flutter/cupertino.dart';

//lib/utils/size_utils.dart
class SizeUtils{

  ///根据Widget绑定的GlobalKey来获取当前Widget的大小
  static Size  getWidgetSize(GlobalKey key){

    Size size = Size.zero;
    ///GlobalKey获取对应的context
    BuildContext stackContext = key.currentContext;
    if(stackContext!=null){
      RenderBox renderBox = stackContext.findRenderObject();
      if(renderBox!=null){
        Offset offset = renderBox.localToGlobal(Offset.zero);
        size =renderBox.paintBounds.size;
      }
    }
    return size;
  }

  ///根据Widget绑定的GlobalKey来获取当前Widget的位置
  ///这里获取到的Offset是当前Widget左上角的位置
  static Offset  getWidgetOffset(GlobalKey key){
    Offset offset = Offset.zero;
    ///获取Stack的大小
    BuildContext stackContext = key.currentContext;
    if(stackContext!=null){
      RenderBox renderBox = stackContext.findRenderObject();
      if(renderBox!=null){
         offset = renderBox.localToGlobal(Offset.zero);
      }
    }
    return offset;
  }


}