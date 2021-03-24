import 'package:configurable/configuration_provider.dart';
import 'package:configurable/dotenv/dotenv.dart' show env;

class DotenvConfigurationProvider implements ConfigurationProvider {
  @override
  bool containsKey(String key) {
    return env.containsKey(key);
  }

  @override
  String? getOrNull(String key, {String? defaultValue}) {
    var value = env[key];

    if (value == null) {
      return defaultValue;
    }

    return value;
  }
}
