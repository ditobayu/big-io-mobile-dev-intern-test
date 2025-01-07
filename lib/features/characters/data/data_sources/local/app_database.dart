import 'package:adhitya/core/util/string_list_converter.dart';
import 'package:adhitya/features/characters/data/data_sources/local/DAO/character_dao.dart';
import 'package:adhitya/features/characters/data/models/character.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [CharacterModel])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}
