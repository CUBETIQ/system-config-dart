import 'package:configurable/dotenv_configuration_provider.dart';
import 'package:configurable/simple_configuration_provider.dart';

void main() {
  var key = 'app.name';
  var value = 'CUBETIQ Solution';

  // in-memory provider (built-in)
  var simpleProvider = SimpleConfigurationProvider();

  // dotenv provider (from file .env)
  var dotenvProvider = DotenvConfigurationProvider();

  
}