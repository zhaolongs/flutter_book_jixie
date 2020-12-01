
import 'package:fluttertoast/fluttertoast.dart';



//Toast工具类
class ToastUtils {
  static void showToast(String message){
    // 根据消息长度决定自动消失时间
    double multiplier = .5;
    //计算显示时间
    int timeInSecForIos = (multiplier * (message.length * 0.06 + 0.5)).round();
    Fluttertoast.cancel();
    //显示Toast
    Fluttertoast.showToast(
      msg: message,
      //显示的位置
      gravity: ToastGravity.CENTER,
      //只针对iOS生效的消失时间
      timeInSecForIosWeb: timeInSecForIos,
    );
  }
}