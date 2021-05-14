import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:configurable/mutable_configurable_provider.dart';

class LocalStorageProvider
    extends MutableConfigurationProvider  {
  static FlutterSecureStorage _storage;

  FlutterSecureStorage _getStorage() {
    if (_storage == null) {
      _storage = new FlutterSecureStorage();
    }

    return _storage;
  }

  @override
  bool containsKey(String key) {
    var _hasKey = false;
    _getStorage().containsKey(key: key).then((value) => _hasKey = value);

    return _hasKey;
  }

  @override
  Future<bool> containsKeyAsync(String key) async {
    return await _getStorage().containsKey(key: key);
  }

  @override
  String? getOrNull(String key, {String defaultValue}) {
    String _value;
    _getStorage().read(key: key).then((value) => {
      _value = value
    });

    if (_value == null && defaultValue != null) {
      return defaultValue;
    } else {
      return _value;
    }
  }

  @override
  Future<String?> getOrNullAsync(String key, {String defaultValue}) async {
    String _value = await _getStorage().read(key: key);

    if (_value == null && defaultValue != null) {
      return defaultValue;
    } else {
      return _value;
    }
  }

  @override
  void remove(String key) {
    _getStorage().delete(key: key);
  }

  @override
  Future<void> removeAsync(String key) async {
    await _getStorage().delete(key: key);
  }

  @override
  void removeAll() {
    _getStorage().deleteAll();
  }

  @override
  Future<void> removeAllAsync() async {
    await _getStorage().deleteAll();
  }

  @override
  void set(String key, String value) {
    _getStorage().write(key: key, value: value);
  }

  @override
  Future<void> setAsync(String key, String value) async {
    await _getStorage().write(key: key, value: value);
  }

  @override
  Future<void> setAllAsync(Map<String, String> configs) async {
    configs.entries.forEach((element) {
      setAsync(element.key, element.value);
    });
  }
}
