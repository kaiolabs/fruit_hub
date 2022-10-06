// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:sqflite/sqflite.dart';

import 'ini_local.dart';

class Inicializa {
  static inicializaAplic() async {
    final Directory destinationDir2 = Directory(await getDatabasesPath());
    await IniLocal.openIni(destinationDir2.path, 'config');
  }
}
