import 'package:configurable/configurable.dart' show getConfigOrNull, hasConfigkey;
import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/system_config.dart';
import 'package:test/test.dart';

void main() {
  test('get system config by key', () {
    var key = 'app.name';
    var value = 'CUBETIQ';
    var result = SystemConfig.getOrNull(key, defaultValue: value);

    expect(value, equals(result));
    expect(value, equals(SystemConfig.getOrNull(key)));
  });

  test('get system config by key with dotenv provider', () {
    var key = 'app.name';
    var value = 'CUBETIQ Solution';

    // set dotenv provider
    SystemConfig.setProvider(DotenvConfigurationProvider());

    var result = SystemConfig.getOrNull(key);

    expect(value, equals(result));
    expect(value, equals(SystemConfig.getOrNull(key)));
  });

  test('get config by key with function', () {
    var key = 'app.name';
    var value = 'CUBETIQ Solution';

    var result = getConfigOrNull(key, defaultValue: value);

    expect(value, equals(result));
    expect(true, equals(hasConfigkey(key)));
    expect(value, equals(getConfigOrNull(key)));
  });
}
