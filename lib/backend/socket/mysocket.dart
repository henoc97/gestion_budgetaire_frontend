import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketSingleton {
  
  static StreamController<String> controller = StreamController.broadcast();
  
  static Stream<String> get broadcastStream => controller.stream;

  static void setupWebSocket() {
    var channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8080'));
  
    channel.stream.listen((message) {
      // String jsonString = json.encode(message);
      controller.add(message);
    });
  }
}