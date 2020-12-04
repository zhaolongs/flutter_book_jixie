import 'dart:async';


/// 创建人： zhaollong
/// 页面说明： 异步消息通知类 类似 eventbus：
/// lib/app/common/event_message.dart
/// 异步消息通知类 类似 eventbus
class EventMessage{
  ///创建实例
  static EventMessage _instance;
  //定义一个Controller
  StreamController _streamController;
  ///构建函数
  factory  EventMessage.getDefault(){
    return _instance ??= EventMessage._init();
  }

  //初始化
  EventMessage._init(){
    _streamController = StreamController.broadcast();
  }

  //注册
  StreamSubscription<T> register<T>(void onData(T event)) {
    ///没有指定类型，全类型注册
    ///监听事件
    if (T == dynamic) {
      return _streamController.stream.listen(onData);
    } else {
      ///筛选出 类型为 T 的数据,获得只包含T的Stream
      Stream<T>stream = _streamController.stream.where((type) => type is T)
          .cast<T>();
      return stream.listen(onData);
    }
  }

  //发送消息
  void post(event) {
    try {
      if (_streamController != null) {
        _streamController.add(event);
      }
    }catch(e){
    }

  }

  //取消注册
  void unregister() {
    if (_streamController != null) {
      _streamController.close();
    }
  }

}
