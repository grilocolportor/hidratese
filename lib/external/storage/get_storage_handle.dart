import 'package:get_storage/get_storage.dart';
import 'package:hidratese/external/storage/get_storage.dart';

class GetStoragehandle implements IGetStorageHandle {
  @override
  Future<void> clearData() async => await GetStorage().erase();

  @override
  Future<bool?> getBool(String key) async => GetStorage().read(key);

  @override
  Future<dynamic> getData(String key) async => await GetStorage().read(key);

  @override
  Future<double?> getDouble(String key) async => GetStorage().read(key);

  @override
  Future<int?> getInt(String key) async => GetStorage().read(key);

  @override
  Future<String?> getString(String key) async => GetStorage().read(key);

  @override
  Future<void> setData(String key, value) async =>
      await GetStorage().write(key, value);
}
