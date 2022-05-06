import 'package:flutter/services.dart';

abstract class IHandlerNativeCode {
  Future<void> onStartconfig();
  Future<void> setPermission();
  Future<void> setAutoStart();
  Future<String> checkDeviceManufacturer();
}

class HandlerNativeCode implements IHandlerNativeCode{
  
  static const startConfig = MethodChannel('channel');

  @override
  Future<void> onStartconfig() async {
    startConfig.setMethodCallHandler((call) async {});
  }

  @override
  Future<void> setPermission() async {
    await startConfig.invokeMethod('setPermission');
  }

  @override
  Future<void> setAutoStart() async {
    await startConfig.invokeMethod('setAutoStart');
  }

  @override
  Future<String> checkDeviceManufacturer() async {
    return await startConfig.invokeMethod('checkDeviceManufacturer');
  }
}
