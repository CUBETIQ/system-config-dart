import 'package:configurable/mutable_configurable_provider.dart';

/// Simple Configuration Provider
///
/// @author sombochea
/// @since 1.0.0
class SimpleConfigurationProvider implements MutableConfigurationProvider {
  Map<String, String?> configs = {};

  @override
  String? getOrNull(String key, {String? defaultValue}) {
    var value = configs[key];

    /// if value is null, then set the default value and return it back
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

  @override
  void set(String key, String? value) {
    configs[key] = value;
  }

  @override
  void remove(String key) {
    configs.remove(key);
  }

  @override
  void removeAll() {
    configs.clear();
  }

  @override
  void setAll(Map<String, String?> configs) {
    configs.addAll(configs);
  }
}
