import 'package:configurable/text_formatter.dart';
import 'package:test/test.dart';

void main() {
  test('text formatter function format', () {
    var text1 = 'Hello, {0}!';
    var result1 = TextFormatter(text1).format(['Sambo']);

    var text2 = 'Hello, {name}!';
    var result2 = TextFormatter(text2).decorate({'name': 'Chea'});

    expect('Hello, Sambo!', result1);
    expect('Hello, Chea!', result2);
  });
}
