abstract class ConfigurationProvider {
  bool containsKey(String key);
  String? getOrNull(String key, {String? defaultValue});
}