import 'package:configurable/configuration_provider.dart';

class SimpleConfigurationProvider implements ConfigurationProvider {
  Map<String, String?> configs = {};

  @override
  String? getOrNull(String key, {String? defaultValue}) {
    var value = configs[key];

    if (value == null) {
      configs[key] = defaultValue;
      return defaultValue;
    }

    return value;
  }

  @override
  bool containsKey(String key) {
    return configs.containsKey(key);
  }
}
