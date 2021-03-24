import 'package:configurable/configuration_provider.dart';
import 'package:configurable/simple_configuration_provider.dart';

class SystemConfig {
  static ConfigurationProvider? provider;

  static void setProvider(ConfigurationProvider provider) {
    SystemConfig.provider = provider;
  }

  static ConfigurationProvider getProvider() {
    if (provider == null) {
      setProvider(SimpleConfigurationProvider());
    }

    return provider!;
  }

  static String get(String key, {String? defaultValue}) {
    return getOrNull(key, defaultValue: defaultValue)!;
  }

  static String? getOrNull(String key, {String? defaultValue}) {
    return getProvider().getOrNull(key);
  }
}
