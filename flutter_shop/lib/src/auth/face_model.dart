import 'package:flutter/services.dart';
import 'package:flutter_shop/src/utils/sp_utils.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/12/28.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572
///
/// 代码清单
/// lib/src/auth/face_model.dart
class FaceModel {
  /// 本地认证框架
  final LocalAuthentication auth = LocalAuthentication();

  // 检查是否有可用的生物识别技术
  Future<bool> checkBiometrics({bool isLocal = true}) async {
    bool canCheckBiometrics;
    try {
      //检查
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
      canCheckBiometrics = false;
    }
    //获取本地缓存标识
    //判断用户是否设置过允许指纹登录 未设置初始时为 null
    //一般在设置中心进行设置
    bool isSetBiometrics = await SPUtil.getBool("biometrices");
    if (isLocal) {
      // 当设置支持生物识别功能 并且用户设置过使用后 返回 true
      return canCheckBiometrics && (isSetBiometrics != null && isSetBiometrics);
    } else {
      return canCheckBiometrics;
    }
  }

  static const andStrings = const AndroidAuthMessages(
    cancelButton: '取消',
    goToSettingsButton: '去设置',
    fingerprintNotRecognized: '指纹识别失败',
    goToSettingsDescription: '请设置指纹.',
    fingerprintHint: '指纹',
    fingerprintSuccess: '指纹识别成功',
    signInTitle: '指纹验证',
    fingerprintRequiredTitle: '请先录入指纹!',
  );

  static const iOSStrings = const IOSAuthMessages(
    lockOut: "指纹登录已被禁用",
    cancelButton: '取消',
    goToSettingsButton: '去设置',
    goToSettingsDescription: '请设置指纹.',
  );

  /// 获取生物识别技术列表
  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    return availableBiometrics;
  }

  /// 生物识别
  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          //提示文案
          localizedReason: '扫描指纹进行身份验证',
          //显示错误提示框
          useErrorDialogs: true,
          //Android平台提示文案
          androidAuthStrings: andStrings,
          //iOS平台提示文案
          iOSAuthStrings: iOSStrings,
          //页面获取焦点是否重新校验
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
      authenticated = false;
    }
    return authenticated;
  }
}
