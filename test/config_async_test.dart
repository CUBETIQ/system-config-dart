import 'package:configurable/configurable.dart'
    show
        getConfigOrNullAsync,
        hasConfigkeyAsync,
        setConfigAsync,
        removeConfigAsync;
import 'package:configurable/simple_configuration_provider.dart';
import 'package:configurable/system_config.dart';
import 'package:test/test.dart';

void main() {
  test('get system config by key', () async {
    var key = 'app.name';
    var value = 'CUBETIQ';

    // set simple provider
    SystemConfig.setProvider(SimpleConfigurationProvider());

    var result = await SystemConfig.getOrNullAsync(key, defaultValue: value);

    expect(value, equals(result));
    expect(value, equals(await SystemConfig.getOrNullAsync(key)));
  });

  test('get config by key with function', () async {
    var key = 'app.name';
    var value = 'CUBETIQ Solution';

    // set simple provider
    SystemConfig.setProvider(SimpleConfigurationProvider());

    var result = await getConfigOrNullAsync(key, defaultValue: value);

    expect(value, equals(result));
    expect(true, equals(await hasConfigkeyAsync(key)));
    expect(value, equals(await getConfigOrNullAsync(key)));
  });

  test('set config by key and value with function', () async {
    var key = 'app.name';
    var value = 'CUBETIQ Solution';

    // set simple provider
    SystemConfig.setProvider(SimpleConfigurationProvider());

    await setConfigAsync(key, value);

    var result = await getConfigOrNullAsync(key);

    expect(value, equals(result));
  });

  test('set and then remove config by key and value with function', () async {
    var key = 'app.name';
    var value = 'CUBETIQ Solution';

    // set simple provider
    SystemConfig.setProvider(SimpleConfigurationProvider());

    await setConfigAsync(key, value);

    var result = await getConfigOrNullAsync(key);

    expect(value, equals(result));

    await removeConfigAsync(key);

    expect(null, equals(await getConfigOrNullAsync(key)));
  });
}
