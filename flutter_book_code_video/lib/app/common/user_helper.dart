import 'package:flutterbookcode/app/bean/bean_user.dart';
import 'package:flutterbookcode/app/common/sp_key.dart';
import 'package:flutterbookcode/utils/code1/sp_utils.dart';

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/24.
///
/// 可关注公众号：我的大前端生涯   获取最新技术分享
/// 可关注网易云课堂：https://study.163.com/instructor/1021406098.htm
/// 可关注博客：https://blog.csdn.net/zl18603543572

///lib/app/common/user_helper.dart
///用户信息辅助操作类
class  UserHelper{
  // 私有构造函数
  UserHelper._() {
    // 具体初始化代码
  }
  ///获取单例对象
  static UserHelper getInstance = UserHelper._();
  ///用户基本信息模型
  UserBean _userBean;
  ///获取 UserBean
  UserBean get userBean => _userBean;
  ///userBean的设置方法
  set userBean(UserBean bean){
    _userBean = bean;
    ///缓存用户信息
    SPUtil.saveObject(spUserBeanKey, bean);
  }
  ///判断用户是否登录的便捷方法
  bool get userIsLogin =>userBean==null?false:true;


  ///是否同同意隐私与用户协议
  bool _userProtocol = false;
  bool get userProtocol =>_userProtocol;
  set userProtocol(bool flag){
    _userProtocol=flag;
    ///保存同意的标识
    SPUtil.save(spUserProtocolKey,flag);
  }
  ///判断用户是否同意用户协议便捷方法
  bool get isUserProtocol =>_userProtocol==null?false:_userProtocol;

  ///用来初始化用户信息的缓存数据
  Future<bool> init() async{
    ///加载缓存数据
   Map<String,dynamic> map  = await SPUtil.getObject(spUserBeanKey);
   if(map!=null){
     ///解析缓存数据
     _userBean = UserBean.fromJson(map);
   }
   return Future.value(true);
  }
}