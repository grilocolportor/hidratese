import 'package:get_storage/get_storage.dart';

abstract class IGetStorageHandle {
  void setData(String key, dynamic value);
  int? getInt(String key) ;

  String? getString(String key) => GetStorage().read(key);

  bool? getBool(String key) => GetStorage().read(key);

  double? getDouble(String key) => GetStorage().read(key);

  dynamic getData(String key) => GetStorage().read(key);

  void clearData() async => GetStorage().erase();
}
