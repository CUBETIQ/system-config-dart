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
