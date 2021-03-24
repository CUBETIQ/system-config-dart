# Dart Configurable Environment

[![Pub](https://img.shields.io/pub/v/configurable.svg)](https://pub.dartlang.org/packages/configurable)

- [x] Allow to get property from env file
- [x] Cache property for runtime
- [x] Dotenv file support (use DotenvConfigurationProvider)
- [x] Support functions (getConfig, getConfigOrNull, hasConfigKey, setConfig)
- [x] Support nullsafety (dart 2.12.2+)
- [x] Custom configuration provider

# Example

```dart
import 'package:configurable/configurable.dart';
import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/simple_configuration_provider.dart';
import 'package:configurable/system_config.dart';

void main() {
  var key = 'app.name';
  var value = 'CUBETIQ Solution';

  /// in-memory provider (built-in)
  var simpleProvider = SimpleConfigurationProvider();
  SystemConfig.setProvider(simpleProvider);
  var result1 = SystemConfig.getOrNull(key, defaultValue: value);

  /// output: CUBETIQ Solution
  print(result1);

  /// get config functions
  getConfig('app.title', defaultValue: 'My App Title!');
  getConfigOrNull('app.null.ignore');

  /// set config functions
  /// support only mutable configuration provider
  setConfig('my.app', 'Hello My App');

  /// dotenv provider (from file .env)
  var dotenvProvider = DotenvConfigurationProvider();
  SystemConfig.setProvider(dotenvProvider);
  var result2 = SystemConfig.getOrNull('HOME');

  /// output: user's home directory
  print(result2);
}
```

# Implement custom configuration provider

```dart
class MyCustomProvider implements ConfigurationProvider {
  Map<String, String?> configDataSet = {};

  @override
  bool containsKey(String key) {
    return configDataSet.containsKey(key);
  }

  @override
  String? getOrNull(String key, {String? defaultValue}) {
    var value = configDataSet[key];

    if (value == null) {
      return defaultValue;
    }

    return value;
  }
}
```

# Contributors

- Sambo Chea <sombochea@cubetiqs.com>

# License

```text
MIT License

Copyright (c) 2021 CUBETIQ Solution

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
