import 'dart:io';
import 'dart:async';

class SocketManage {
  static String host = '测试地址';
  static int port = 80;
  static Socket mSocket;
  static Stream<List<int>> mStream;

  static initSocket() async {

    await Socket.connect(host, port).then((Socket socket) {
      socket.writeln("GET / HTTP/1.1");
      socket.writeln("Host:baidu.com");
      socket.writeln("Connection:close");
      mSocket = socket;
      //多次订阅的流 如果直接用socket.listen只能订阅一次
      mStream = mSocket.asBroadcastStream();
    }).catchError((e) {
      print('connectException:$e');
      initSocket();
    });
  }

  static void addParams(List<int> params) {
    mSocket.add(params);
  }

  static void dispose() {
    mSocket.close();
  }
}
