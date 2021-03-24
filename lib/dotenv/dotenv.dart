library dotenv;

import 'dart:io';

import 'package:meta/meta.dart';

// load functions from parser
part 'dotenv_parser.dart';

// create in-memory variables store
var _env = Map<String, String>.from(Platform.environment);

// move from platforms env with default vars
Map<String, String> get env => _env;

// clean the env and set default from platform environment
Map clean() => _env = Map.from(Platform.environment);

// check the variables that defined in .env or platform env
bool isEveryDefined(Iterable<String> vars) =>
    vars.every((k) => _env[k] != null && (_env[k]?.isNotEmpty ?? false));

// load file .env from project root
void load([String filename = '.env', DotenvParser psr = const DotenvParser()]) {
  var file = File.fromUri(Uri.file(filename));
  var lines = _verify(file);
  _env.addAll(psr.parse(lines));
}

// verify file .env
List<String> _verify(File file) {
  if (file.existsSync()) return file.readAsLinesSync();
  stderr.writeln('[dotenv] Load failed: file not found: $file');
  return [];
}
