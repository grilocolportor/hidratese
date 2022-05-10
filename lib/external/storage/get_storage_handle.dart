import 'package:get_storage/get_storage.dart';
import 'package:hidratese/external/storage/get_storage.dart';

class GetStoragehandle implements IGetStorageHandle{
  @override
  void clearData()=> GetStorage().erase();

  @override
  bool? getBool(String key) => GetStorage().read(key);

  @override
  getData(String key) => GetStorage().read(key);

  @override
  double? getDouble(String key) => GetStorage().read(key);

  @override
  int? getInt(String key) => GetStorage().read(key);

  @override
  String? getString(String key) => GetStorage().read(key);

  @override
  void setData(String key, value) => GetStorage().write(key, value);

}