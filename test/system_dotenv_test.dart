import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/system_config.dart';
import 'package:test/test.dart';

void main() {
  test('get system config by key with dotenv provider', () {
    var key = 'app.title';
    var value = 'CUBETIQ Solution';

    // set dotenv provider
    SystemConfig.setProvider(DotenvConfigurationProvider());

    var result = SystemConfig.getOrNull(key);

    expect(value, equals(result));
    expect(value, equals(SystemConfig.getOrNull(key)));
  });
}
