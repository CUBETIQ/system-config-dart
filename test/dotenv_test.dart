import 'package:configurable/dotenv/dotenv.dart';
import 'package:test/test.dart';

void main() {
  test('just call env', () {
    load();
  
    var result = env['app.title'];

    expect('CUBETIQ Solution', equals(result));
  });

  test('get export variable', () {
    load();

    var result = env['NAME'];

    expect('Sambo Chea', equals(result));
  });
}
