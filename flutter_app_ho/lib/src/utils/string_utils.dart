/*
 * 创建人： zhaollong
 * 创建时间：2019-09-16
 * 页面说明：String 工具
 * 功能性修改记录：
 */

///字符串操作工具类
///lib/utils/string_utils.dart
class StringUtils {
  //判断String 是否为空 为空返回 true
  static bool isEmpty(String tagText) {
    return tagText == null || tagText.isEmpty;
  }

  ///对数字小数点的取舍 默认保留小数点后两位
  static String getDecimalPoint(double tagNumber, {int fractionDigits = 2}) {
    //返回一个字符串
    return tagNumber.toStringAsFixed(fractionDigits);
  }
}
