

/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/7/17.
///
/// 创建人： Created by zhaolong
/// 创建时间：Created by  on 2020/9/25.
///
/// gongzhonghao biglead
/// github https://github.com/zhaolongs
/// bili https://space.bilibili.com/513480210
/// zhihu https://www.zhihu.com/people/zhao-long-90-89
/// csdn https://blog.csdn.net/zl18603543572
/// 西瓜视频 https://www.ixigua.com/home/3662978423

///lib/demo/shake/shake_animation_controller.dart
///抖动监听
typedef ShakeAnimationListener = void Function(bool isOpen, int shakeCount);

///抖动动画控制器
class ShakeAnimationController {
  ///当前抖动动画的状态
  bool animationRunging = false;
  ///监听
  ShakeAnimationListener _shakeAnimationListener;

  ///控制器中添加监听
  setShakeListener(ShakeAnimationListener listener) {
    _shakeAnimationListener = listener;
  }

  ///打开
  void start({int shakeCount = 1}) {
    if (_shakeAnimationListener != null) {
       animationRunging = true;
      _shakeAnimationListener(true, shakeCount);
    }
  }

  ///关闭
  void stop() {
    if (_shakeAnimationListener != null) {
      animationRunging = false;
      _shakeAnimationListener(false, 0);
    }
  }
  ///移除监听
  void removeListener() {
    _shakeAnimationListener=null;
  }
}
