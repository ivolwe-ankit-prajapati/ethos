
import 'package:get_storage/get_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static GetStorage? localstorage;

  LocalStorageService._internal();

  static Future<LocalStorageService?> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._internal();
    }
    if (localstorage == null) {
      localstorage = await GetStorage();
    }

    return _instance;
  }

  Future<String> getDataFromDisk(String key) async {
    var value = await localstorage!.read(key) ?? "";
    return value;
  }

  void saveDataToDisk(String key, String content) async {
    await localstorage!.write(key, content);
  }

  Future<bool> getboolDataFromDisk(String key) async {
    var value = await localstorage!.read(key) ?? false;
    return value;
  }

  void saveboolDataToDisk(String key, bool content) async {
    await localstorage!.write(key, content);
  }
}


/*
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences localstorage;

  LocalStorageService._internal();

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService._internal();
    }
    if (localstorage == null) {
      localstorage = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  Future<String> getDataFromDisk(String key) async {
    var value = await localstorage.get(key) ?? "";
    return value;
  }

  void saveDataToDisk(String key, String content) async {
    await localstorage.setString(key, content);
  }

  Future<bool> getboolDataFromDisk(String key) async {
    var value = await localstorage.getBool(key) ?? false;
    return value;
  }

  void saveboolDataToDisk(String key, bool content) async {
    await localstorage.setBool(key, content);
  }
}
*/


