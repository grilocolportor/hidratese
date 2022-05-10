import 'package:get_storage/get_storage.dart';

abstract class IGetStorageHandle {
  Future<void> setData(String key, dynamic value);

  Future<int?> getInt(String key) ;

  Future<String?> getString(String key) => GetStorage().read(key);

  Future<bool?> getBool(String key) => GetStorage().read(key);

  Future<double?> getDouble(String key) => GetStorage().read(key);

  Future<dynamic> getData(String key) => GetStorage().read(key);

  Future<void> clearData() async => await GetStorage().erase();
}
