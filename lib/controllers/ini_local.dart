import 'dart:io';

import 'package:ini/ini.dart';

class IniLocal {
  static late File file;
  static late Config config;

  static openIni(String directory, String fileName) async {
    IniLocal.file = await File("$directory/$fileName.ini").create(recursive: true);
    IniLocal.config = Config.fromStrings(file.readAsLinesSync());
  }

  static String readString(String section, String key) {
    final ret = config.get(section, key);
    return ret ?? '';
  }

  static bool readBool(String section, String key) {
    final ret = config.get(section, key);
    return ret == null
        ? false
        : ret == "1"
            ? true
            : false;
  }

  static writeBool(String section, String key, bool value) {
    if (!config.hasSection(section)) {
      config.addSection(section);
    }
    config.set(section, key, value ? '1' : '0');
    file.writeAsString(config.toString());
  }

  static writeString(String section, String key, String value) {
    if (!config.hasSection(section)) {
      config.addSection(section);
    }
    config.set(section, key, value);
    file.writeAsString(config.toString());
  }
}
