import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:marketplaceapp/module/module.dart';
import 'package:marketplaceapp/utils/utils.dart';

class PlannerSocketServiceController {

  IO.Socket? _socket; // ✅ Make it nullable instead of late
  IO.Socket? get socket => _socket;

  UserLoginResponseModel userLoginResponseModel = UserLoginResponseModel();

  Future<PlannerSocketServiceController> init() async {
    print("hello socket");

    // 🔹 Load login response safely
    userLoginResponseModel = UserLoginResponseModel.fromJson(jsonDecode(LocalStorageUtils.getString(AppConstantUtils.plannerLoginResponse)!));


    final token = userLoginResponseModel.data?.accessToken ?? '';
    print("Bearer $token");

    // 🔹 Create and connect socket
    _socket = IO.io(
      ApiUtils.socketUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
        'extraHeaders': {'token': token},
      },
    );

    // 🔹 Socket event handlers
    _socket!.on('connect', (_) {
      print('🟢 Socket connected');
      print('My Token ID: $token');
      _socket!.emit("connection", token);
    });

    _socket!.on('newOrder', (data) {
      print('📦 New order event received: $data');
    });

    _socket!.on('disconnect', (_) async {
      print('🔴 Socket disconnected, trying to reconnect...');
      await Future.delayed(const Duration(seconds: 3));
      await init(); // ✅ Auto-reconnect safely
    });

    return this;
  }

  // 🔹 Safe disconnect
  void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
      _socket = null;
      print('⚪ Socket disconnected manually');
    }
  }

  // 🔹 Safe emit with ack
  Future<dynamic> emitWithAck(String event, dynamic data) async {
    if (_socket == null) {
      print('⚠️ Socket not connected yet. Cannot emit.');
      return null;
    }
    return _socket!.emitWithAck(event, data);
  }


}