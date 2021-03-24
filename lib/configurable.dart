library configurable;

import 'package:configurable/system_config.dart';

String? getConfigOrNull(String key, {String? defaultValue}) =>
    SystemConfig.getOrNull(key, defaultValue: defaultValue);
String getConfig(String key, {String? defaultValue}) =>
    SystemConfig.get(key, defaultValue: defaultValue);
bool hasConfigkey(String key) => SystemConfig.containsKey(key);
