import 'package:flutter/services.dart';



class HandlerNativeCode {
  
  static const startConfig = MethodChannel('channel');

  Future<void> onStartconfig() async {
    startConfig.setMethodCallHandler((call) async {});
  }

  Future<void> setPermission() async {
    await startConfig.invokeMethod('setPermission');
  }

  Future<void> setAutoStart() async {
    await startConfig.invokeMethod('setAutoStart');
  }

  Future<String> checkDeviceManufacturer() async {
    return await startConfig.invokeMethod('checkDeviceManufacturer');
  }
}
