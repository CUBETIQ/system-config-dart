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
}
