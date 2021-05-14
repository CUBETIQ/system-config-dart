import 'package:configurable/configuration_provider.dart';
import 'package:configurable/dotenv/dotenv.dart' show env, load;

/// Dotenv Configuration Provider
///
/// @author sombochea
/// @since 1.0.0
class DotenvConfigurationProvider extends ConfigurationProvider {
  /// default constructor to load the platform environment
  DotenvConfigurationProvider() {
    load();
  }

  @override
  bool containsKey(String key) {
    return env.containsKey(key);
  }

  @override
  String? getOrNull(String key, {String? defaultValue}) {
    var value = env[key];

    /// if value is null, then return default value
    if (value == null) {
      return defaultValue;
    }

    return value;
  }
}
