import 'package:flutter/services.dart';

class HandlerNativeCode {
  static final HandlerNativeCode _instance = HandlerNativeCode._internal();

  static const startConfig = MethodChannel('channel');

  factory HandlerNativeCode() {
    return _instance;
  }
  HandlerNativeCode._internal();

  static void onStartconfig() async {
    startConfig.setMethodCallHandler((call) async {});
  }

  static Future<void> setPermission() async {
    await startConfig.invokeMethod('setPermission');
  }

  static Future<void> setAutoStart() async {
    await startConfig.invokeMethod('setAutoStart');
  }

  static Future<String> checkDeviceManufacturer() async {
    return await startConfig.invokeMethod('checkDeviceManufacturer');
  }
}