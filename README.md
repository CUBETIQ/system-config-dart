# Dart Configurable Environment
- [x] Allow to get property from env file
- [x] Cache property for runtime
- [x] Dotenv file support (use DotenvConfigurationProvider)
- [x] Support functions (getConfig, getConfigOrNull, hasConfigKey)
- [x] Support nullsafety (dart 2.12.2+)

# Example
```dart
import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/simple_configuration_provider.dart';
import 'package:configurable/system_config.dart';

void main() {
  var key = 'app.name';
  var value = 'CUBETIQ Solution';

  // in-memory provider (built-in)
  var simpleProvider = SimpleConfigurationProvider();
  SystemConfig.setProvider(simpleProvider);
  var result1 = SystemConfig.getOrNull(key, defaultValue: value);
  // output: CUBETIQ Solution
  print(result1);

  // dotenv provider (from file .env)
  var dotenvProvider = DotenvConfigurationProvider();
  SystemConfig.setProvider(dotenvProvider);
  var result2 = SystemConfig.getOrNull('HOME');

  // output: user's home directory
  print(result2);
}
```

# Contributors
- Sambo Chea <sombochea@cubetiqs.com>